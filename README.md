# utucodetest-backend

### 1. Solution summary
This solution is built based on the assumption of showing the latest crypto data, which is the data on Dec 04, 2019. The calculation, for example, "7d change difference" is calculated using data 7 days before Dec 04, 2019. The calculation of other data is so forth. If the solution can let user choose to view crypto data on any date and calculate the above data("7d change difference" and so on), it will be a bigger problem to solve.<br /><br />
Technologies used: Ruby 2.7.0, Ruby Sinatra, Psql, ActiveRecord, Minitest

### 2. How to run this solution
1. Install RVM(Ruby Version Manager) and Ruby 2.7.0 if you don't have it in your system. 

2. Install dependencies<br />
Clone this solution repo to your machine, inside the repo directory, type the following in terminal window: `bundle`<br /> 
If you can't find the command, install by typing `gem install bundler`<br />
This will install the dependencies required to run the solution.

3. Setup database<br /> 
Open a new terminal window, connect to psql by typing: `psql`<br />
Refer to `schema.sql` in repo, copy the 1st line and run it in psql window. This will create the database.<br />
Connect to this database by typing: `\c utu_code_test`<br />
Create database table by copying the rest in `schema.sql`

4. Load csv data<br />
Go back to the repo directory window, run the `load_data.rb` program __ONLY ONCE__ by typing: `ruby load_data.rb`<br /> 
It parses the `crypto_historical_data.csv` file and populates the database.

5. API ready to use<br />
In the repo directory window, run the `main.rb` program by typing: `ruby main.rb`<br />
To see the API data, open your web browser, type in: `localhost:4567/crypto_api`<br />
The API returns an array of json. This API will be used for React frontend development. The repo for the React frontend is [here](https://github.com/allen0lee/utucodetest-react).

6. This solution also provides test on the calculation function. The calculation function is in `calculation.rb`. To run the test, in the repo directory window, run the test file by typing: `ruby calculation_test.rb`

     
