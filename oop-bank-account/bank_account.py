class BankAccount:

    def __init__(self, name, balance=0):
        self.name = name
        self.balance = balance
        self.transactions = []

    def deposit(self, amount):
        self.balance += amount
        self.transactions.append({
            "type": "Deposit",
            "amount": amount
        })
        print("Amount deposited successfully.")

    def withdraw(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            self.transactions.append({
                "type": "Withdraw",
                "amount": amount
            })
            print("Amount withdrawn successfully.")
        else:
            print("Insufficient balance.")

    def show_balance(self):
        print(f"Account Holder: {self.name}")
        print(f"Balance: ₹{self.balance}")

    def show_transactions(self):
        print("\nTransaction History")

        for transaction in self.transactions:
            print(transaction["type"], "₹" + str(transaction["amount"]))


account = BankAccount("Chethan", 5000)

while True:

    print("\n1. Deposit")
    print("2. Withdraw")
    print("3. Balance")
    print("4. Transactions")
    print("5. Exit")

    choice = input("Enter choice: ")

    if choice == "1":
        amount = float(input("Enter amount: "))
        account.deposit(amount)

    elif choice == "2":
        amount = float(input("Enter amount: "))
        account.withdraw(amount)

    elif choice == "3":
        account.show_balance()

    elif choice == "4":
        account.show_transactions()

    elif choice == "5":
        break

    else:
        print("Invalid choice.")