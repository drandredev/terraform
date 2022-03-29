## Architecture
![](architecture.png)

## Notes:
- Had to add security group with IP of ec2 instance for inbound access (by default inbound traffic was blocked)
- To connect to DB (`psql -U foo -d mydb -p 5432 -h "yourdb"`)