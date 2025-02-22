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
        // Validasi input data
        $request->validate([
            'email'  => 'required|email|exists:users,email',
            'name'   => 'required|string|max:255',
            'gender' => 'required',
            'dob' => 'required',
            'weight' => 'required',
            'height' => 'required',
        ]);

        // Cari user berdasarkan email
        $user = User::where('email', $request->input('email'))->first();

        // Update kolom yang sudah ada tanpa membuat kolom baru
        // Misalnya, menambahkan data 'nama' dan 'gender'
        $user->name = $request->input('name');
        $user->gender = $request->input('gender');
        $user->dob = $request->input('dob');
        $user->weight = $request->input('weight');
        $user->height = $request->input('height');
        
        // Simpan perubahannya ke database
        $user->save();

        return response()->json([
            'message' => 'Data berhasil diperbarui',
            'data' => $user
        ]);
    }
}
