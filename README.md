# Stories App

Stories App is an aplication that allows users to create stories, review it and publish them. Following the green path (unnasigned - draft - for review - in review - approved - published).
Where only admins (chief editors) can create stories, writers assigned can update the body, and reviewers assigned can review it for approval.

It was developed using **Ruby On Rails** and **MySQL Database**


## Instructions for running the project

### Using Docker

**1. Create containers**
```
sudo docker-compose build
```
After creating, press Ctrl + C to exit the container

**2. Create databases**
```
sudo docker-compose run web rake db:create
```

**3. Run migrations**
```
sudo docker-compose run web rake db:migrate
```

**4. Run Seeds**

```
sudo docker-compose run web rake db:seed
```

**5. Start container**
```
sudo docker-compose up
```

**Run Tests**

```
sudo docker-compose run web rspec

```
### Alternative - If you want to use just the database as an external service
```
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql:5.7

```
Then run the commands bellow, except number 1.

### Without Docker

**1. Install `mysql`**

```
sudo apt-get update
sudo apt-get install mysql-server
```
**2. Access project root**
```
cd stories_app/
```

**3. Install gems**

```
bundle install
```

**4. Create database**

```
rake db:create
```

**5. Run migrations**

```
rake db:migrate
```
**6. Run Seeds**

```
rake db:seed
```

**6. Start server**

```
rails s 

```

**7. Default Data

```
By using the seeds.rb file included in the project. 
You have some Users created for logging into the app.

The default password for all of them is: 123456

  email: cpn1_chief@test.com - chief editor of organization 'cpn1'
  email: cpn1_writer@test.com - writer of organization 'cpn1' 
  email: cpn1_reviewer@test.com'- reviewer of organization 'cpn1'
  email: cpn1_writer2@test.com - writer of organization 'cpn1'
  email: cpn2_chief@test.com - chief editor of organization 'cpn2'
  email: cpn2_writer@test.com - writer of organization 'cpn1'
  email: cpn2_reviewer@test.com' -  reviewer of organization 'cpn2'
  
  All roles assigned above are related to the stories created 
  when running the default seeds.rb. The only two roles available are chief editor and writer.
  
```
