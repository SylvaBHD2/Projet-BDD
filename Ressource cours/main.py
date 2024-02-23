import mysql.connector
import plotly.express as px
import pandas as pd

mydb = mysql.connector.connect(
  host="localhost",
  user="uBDD",
  password="M*&xvTdpRL94uF",
  database="l3tdcinema",
  auth_plugin='mysql_native_password'
)

# if mydb.is_connected():
#     print ("Connected to MySQL database")
# else:
#     print ("Error connecting to MySQL database")

# mycur = mydb.cursor()
# mycur.execute("SELECT nom_cinema,count(distinct id_film) as nb_film FROM seance group by nom_cinema")
# myres = mycur.fetchall()

# for x in myres:
#     print(x)


req = "SELECT nom_cinema,count(distinct id_film) as nb_film FROM seance group by nom_cinema"
# df = pd.DataFrame(myres, columns=['nom_cinema', 'nb_film'])
# fig = px.histogram(df, x="nom_cinema")$
df = pd.read_sql_query(req, mydb)
fig2= px.line(df, x="nom_cinema", y="nb_film")
fig2.show()

fig3=px.histogram(df, x="nom_cinema", y="nb_film")
fig3.show()

# mycur.close()
mydb.close()

