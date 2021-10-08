log_file = open("um-server-01.txt")
# this line of code is opening the server file

def sales_reports(log_file): #this line is calling on the opened file
    for line in log_file:    #this line is refering to the contents of the opened file
        line = line.rstrip() #this line is returning a copy of the string and removing the trailing characters
        day = line[0:3] #this code is calling for specific data in the opened file
        if day == "Mon": #this code is using the variable day to refer to specific data in the um-server database specifically if the day in the column is equal to Monday.
            print(line) #this line of code will display the lines ascribed to it in the previous line of code if the data matches the request


sales_reports(log_file) #this code is calling upon the function above which will run all lines of code in the function and will return the data requested by the function.
