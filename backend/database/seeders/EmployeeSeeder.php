<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmployeeSeeder extends Seeder
{
    public function run(): void
    {
        // Optional: disable foreign key checks if needed
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table('employees')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        DB::table('employees')->insert([

            [
                'name' => 'Arun Prakash',
                'email' => 'arun.prakash@example.com',
                'joining_date' => '2015-02-18',
                'is_active' => true,
                'role' => 'Senior Software Engineer',
                'image' => 'employees/1.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Divya Krishnan',
                'email' => 'divya.krishnan@example.com',
                'joining_date' => '2019-06-12',
                'is_active' => true,
                'role' => 'UI/UX Designer',
                'image' => 'employees/2.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Karthik Raman',
                'email' => 'karthik.raman@example.com',
                'joining_date' => '2017-11-03',
                'is_active' => true,
                'role' => 'Backend Developer',
                'image' => 'employees/3.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Ananya Iyer',
                'email' => 'ananya.iyer@example.com',
                'joining_date' => '2021-01-25',
                'is_active' => true,
                'role' => 'Frontend Developer',
                'image' => 'employees/4.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Vignesh Kumar',
                'email' => 'vignesh.kumar@example.com',
                'joining_date' => '2014-09-15',
                'is_active' => false,
                'role' => 'Software Architect',
                'image' => 'employees/5.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Sneha Nair',
                'email' => 'sneha.nair@example.com',
                'joining_date' => '2020-04-30',
                'is_active' => true,
                'role' => 'Mobile App Developer',
                'image' => 'employees/6.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Rahul Menon',
                'email' => 'rahul.menon@example.com',
                'joining_date' => '2016-07-19',
                'is_active' => true,
                'role' => 'DevOps Engineer',
                'image' => 'employees/7.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Pooja Sharma',
                'email' => 'pooja.sharma@example.com',
                'joining_date' => '2018-12-05',
                'is_active' => true,
                'role' => 'Product Designer',
                'image' => 'employees/8.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Sandeep Reddy',
                'email' => 'sandeep.reddy@example.com',
                'joining_date' => '2013-03-22',
                'is_active' => false,
                'role' => 'Engineering Manager',
                'image' => 'employees/9.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Manoj Varma',
                'email' => 'manoj.varma@example.com',
                'joining_date' => '2015-08-14',
                'is_active' => true,
                'role' => 'Tech Lead',
                'image' => 'employees/10.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Kavya Srinivasan',
                'email' => 'kavya.srinivasan@example.com',
                'joining_date' => '2022-02-10',
                'is_active' => true,
                'role' => 'Junior Software Developer',
                'image' => 'employees/11.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'Nisha Patel',
                'email' => 'nisha.patel@example.com',
                'joining_date' => '2019-10-27',
                'is_active' => true,
                'role' => 'QA Engineer',
                'image' => 'employees/12.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

        ]);
    }
}