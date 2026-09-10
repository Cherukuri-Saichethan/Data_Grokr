def grade_calculator(marks):
    total = 0

    for mark in marks:
        total += mark

    average = total / len(marks)

    if average >= 90:
        grade = "A"
    elif average >= 80:
        grade = "B"
    elif average >= 70:
        grade = "C"
    elif average >= 60:
        grade = "D"
    else:
        grade = "F"

    return total, average, grade


students = {}

while True:
    name = input("Enter student name: ")

    marks = []

    for i in range(3):
        mark = int(input("Enter mark: "))
        marks.append(mark)

    total, average, grade = grade_calculator(marks)

    students[name] = {
        "total": total,
        "average": average,
        "grade": grade
    }

    print("\nName:", name)
    print("Total:", total)
    print("Average:", average)
    print("Grade:", grade)

    choice = input("\nAdd another student? yes/no: ")

    if choice == "no":
        break


print("\nAll Students:")

for name, details in students.items():
    print(
        name,
        details["total"],
        details["average"],
        details["grade"]
    )