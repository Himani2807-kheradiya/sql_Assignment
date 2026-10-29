
import pandas as pd
from sqlalchemy import create_engine

# Read the CSV file
df = pd.read_csv("mi_matches.csv")

# Display column names to verify them
print(df.columns.tolist())

# Filter matches won by Mumbai Indians
mi_wins = df[
    df["winner"] == "Mumbai Indians"
]

# Connect to MySQL
engine = create_engine(
    "mysql+pymysql://root:himi@localhost/ipl_db"
)

# Insert the winning matches into a new table
mi_wins.to_sql(
    "mi_wins",
    con=engine,
    if_exists="replace",
    index=False
)

print("Winning matches inserted successfully!")
print("Total wins:", len(mi_wins))
print(mi_wins.head())
