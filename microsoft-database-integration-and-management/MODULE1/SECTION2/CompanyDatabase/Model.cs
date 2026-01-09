using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

public class CompanyDatabaseContext : DbContext {
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Department> Departments { get; set; }

    public string DbPath { get; }

    public CompanyDatabaseContext()
    {
        var folder = Environment.SpecialFolder.LocalApplicationData;
        var path = Environment.GetFolderPath(folder);
        DbPath = System.IO.Path.Join(path, "companydatabase.db");
    }

    protected override void OnConfiguring(DbContextOptionsBuilder options)
        => options.UseSqlite($"Data Source={DbPath}");

}

public class Employee {
    // Primary Key
    [Key]
    public int EmployeeID { get; set; }
    // Employee's first name
    [Required]
    [StringLength(50)]
    public string FirstName { get; set; }
    // Employee's last name
    [Required]
    [StringLength(50)]
    public string LastName { get; set; }
    // Date the employee was hired
    public DateTime HireDate { get; set; }

    // Foreign key to Department
    public int DepartmentID { get; set; }

    // Navigation property to Department
    public Department Department { get; set; }
}

public class Department
    {
        [Key]
        public int DepartmentID { get; set; }

        [Required]
        [StringLength(50)]
        public string DepartmentName { get; set; }

        public List<Employee> Employees { get; set; }
    }