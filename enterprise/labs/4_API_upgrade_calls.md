## API Version
```
harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/version'
v18
harshal@shreeganesh ~/SEBC/enterprise/labs $ 
```
## CM Version
```
harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v1/cm/version' | jq '.version'
"5.13.0"
harshal@shreeganesh ~/SEBC/enterprise/labs $ 
```
## CM USers
```
harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v12/users'
{
  "items" : [ {
    "name" : "admin",
    "roles" : [ "ROLE_LIMITED" ]
  }, {
    "name" : "harshal-yb",
    "roles" : [ "ROLE_ADMIN" ]
  }, {
    "name" : "minotaur",
    "roles" : [ "ROLE_CONFIGURATOR" ]
  } ]
}harshal@shreeganesh ~/SEBC/enterprise/labs $ 
```
## CM Database server Type
```
harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v14/cm/scmDbInfo' | jq '.scmDbType'
"MYSQL"
harshal@shreeganesh ~/SEBC/enterprise/labs $ 
```
