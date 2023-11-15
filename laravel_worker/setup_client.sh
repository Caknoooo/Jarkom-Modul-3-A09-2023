apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y

# POST Register 
echo '
{
  "username": "kelompoka09",
  "password": "passworda09"
}' > register.json

# POST Login
echo '
{
  "username": "kelompoka09",
  "password": "passworda09"
}' > register.json

# Get me


# Testing No 15 16 17
# Register
ab -n 100 -c 10 -p register.json -T application/json http://www.granz.channel.a09.com/api/auth/register

ab -n 100 -c 10 -p login.json -T application/json http://www.granz.channel.a09.com/api/auth/login

# Login
ab -n 10 -c 5 -p data.json -T application/json -g login_output.txt http://192.173.4.1/api/auth/login

token=$(cat login_output.txt | jq -r '.token')

# Get Me
ab -n 100 -c 10 -H "Authorization: Bearer $token" http://192.173.4.1/api/me