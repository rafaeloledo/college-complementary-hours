using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;

using var context = new CompanyDatabaseContext();

Console.WriteLine($"Database path: {context.DbPath}.");

// Create
context.Departments.Add(
    new Department
    {
        DepartmentName = "Engineering",
        Employees = new List<Employee>
        {
            new Employee
            {
                FirstName = "Alice",
                LastName = "Johnson",
                HireDate = DateTime.Now
            },
            new Employee
            {
                FirstName = "Bob",
                LastName = "Smith",
                HireDate = DateTime.Now
            }
        }
    }
);

await context.SaveChangesAsync();

// Read
var department = await context.Departments.OrderBy(d => d.DepartmentID).FirstAsync();
Console.WriteLine($"Department: {department.DepartmentName} with ID {department.DepartmentID}");

var employees = await context.Employees
    .Where(e => e.DepartmentID == department.DepartmentID)
    .ToListAsync();

var firstEmployee = employees.ElementAtOrDefault(0);

Console.WriteLine(firstEmployee?.FirstName);

// Update

firstEmployee?.FirstName = "Robson";
firstEmployee?.LastName = "Santos";
await context.SaveChangesAsync();

// Delete
context.Remove(firstEmployee!);
await context.SaveChangesAsync();