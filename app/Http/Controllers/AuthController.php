<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;


class AuthController extends Controller
{
    //
    public function register(Request $req)
    {
        //valdiate
        $rules = [
            'email' => 'required',
            'password' => 'required'
        ];
        $validator = Validator::make($req->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        //create new user in users table
        $user = User::create([
            'email' => $req->email,
            'password' => Hash::make($req->password)
        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user' => $user, 'token' => $token];
        return response()->json($response, 200);
    }

    public function login(Request $req)
    {
        // validate inputs
        $rules = [
            'email' => 'required',
            'password' => 'required|string'
        ];
        $req->validate($rules);
        // find user email in users table
        $user = User::where('email', $req->email)->first();
        // if user email found and password is correct
        if ($user && Hash::check($req->password, $user->password)) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['user' => $user, 'token' => $token];
            return response()->json($response, 200);
        }
        $response = ['message' => 'Incorrect email or password'];
        return response()->json($response, 400);
    }

    public function updateData(Request $request)
    {
        // \Log::info('Data diterima:', $request->all());
        // Validasi input data

        // $user = request()->user(); 

        $request->validate([
            'email' => 'required|email',
            // 'name'   => 'required|string|max:255',
            // 'gender' => 'required',
            // 'dob' => 'required',
            // 'weight' => 'required',
            // 'height' => 'required',
        ]);

        $user = User::where('email', $request->input('email'))->first();

        $user->update([
            'name'   => $request->input('name'),
            'gender' => $request->input('gender'),
            'dob'    => $request->input('dob'),
            'weight' => $request->input('weight'),
            'height' => $request->input('height'),
        ]);

        if ($user->save()) {
            return response()->json([
                'message' => 'Data berhasil diperbarui',
                'data'    => $user
            ]);
        } else {
            return response()->json([
                'message' => 'Gagal menyimpan data ke database'
            ], 500);
    }
}
}