"""
Save transformed records to the database.
"""
import db_conn
# from datetime import datetime

def save_violation(record):
    # cursor = db_conn.mydb.cursor()

    # session = Session(engine)
    # Violation =
    # rudimentary relationships are produced
    db_conn.session.add(db_conn.Violation(**record))
    db_conn.session.commit()


if __name__ == "__main__":
    pass
    # save_violation({'ticket_number': 4273069673, 'issue_date': datetime(2015, 12, 30, 0, 0), 'make': 'FORD', 'body_style': 'PA', 'color': 'GY', 'location': '4248 WEST 1ST STREET', 'route': '00479', 'agency': '54', 'violation_code': '80.69BS', 'violation_description': 'NO PARK/STREET CLEAN', 'fine_amount': 73.0, 'latitude': -118.30423956105004, 'longitude': 34.07372428187298})
