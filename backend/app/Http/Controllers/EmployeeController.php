<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Carbon\Carbon;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $employees = Employee::all()->map(function ($employee) {
            $experienceYears = (int) Carbon::parse($employee->joining_date)->diffInYears(now());

            $isVeteran = $employee->is_active && $experienceYears >= 5;

        return [
            'id' => $employee->id,
            'name' => $employee->name,
            'email' => $employee->email,
            'joining_date' => $employee->joining_date,
            'is_active' => (bool) $employee->is_active,
            'experience_years' => $experienceYears,
            'is_veteran' => $isVeteran,
            'role' => $employee->role,
            'image_url' => $employee->image
                ? asset('storage/' . $employee->image)
                : null
            ];
        });

        return response()->json([
            'data' => $employees,
            'message' => 'Employee list fetched successfully',
            'success' => true,
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:employees,email',
        'joining_date' => 'required|date',
        'is_active' => 'required|boolean',
        'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048'
    ]);

    // Handle image upload
        if ($request->hasFile('image')) {

            $imagePath = $request->file('image')->store(
                'employees',   // folder name
                'public'       // storage disk
            );

            $validated['image'] = $imagePath;
        }

        $employee = Employee::create($validated);

        return response()->json([
        'data' => [
            'id' => $employee->id,
            'name' => $employee->name,
            'email' => $employee->email,
            'joining_date' => $employee->joining_date,
            'is_active' => $employee->is_active,
            'image_url' => $employee->image
                ? asset('storage/' . $employee->image)
                : null
            ],
        'message' => 'Employee created successfully',
        'success' => true,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Employee $employee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Employee $employee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Employee $employee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Employee $employee)
    {
        //
    }
}
