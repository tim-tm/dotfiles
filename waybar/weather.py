import requests
import json
import sys
from datetime import datetime


def err(txt):
    print(json.dumps({"text": txt, "class": "weather"}))
    sys.exit(1)


DATE_FORMAT = "%Y-%m-%dT%H:%M"
LATITUDE = 51.7189
LONGITUDE = 8.7575
TIMEZONE = "Europe%2FBerlin"

response = requests.get(
    f"https://api.open-meteo.com/v1/forecast?latitude={LATITUDE}&longitude={LONGITUDE}&hourly=temperature_2m&timezone={TIMEZONE}&forecast_days=1"
)
if response.status_code != 200:
    err("no data")

try:
    response = response.json()
except json.JSONDecodeError:
    err("no data")

times = response["hourly"]["time"]
temp_unit = response["hourly_units"]["temperature_2m"]

curr_time = datetime.now()
temp_idx = 0
for i, date_str in enumerate(times):
    dat = datetime.strptime(date_str, DATE_FORMAT)
    if dat >= curr_time:
        temp_idx = i - 1
        break

time_temp = ""
for i in range(temp_idx - 1, len(times)):
    dat = datetime.strptime(response["hourly"]["time"][i], DATE_FORMAT)
    if i == temp_idx:
        time_temp += '<span background="#ddc7a1" background_alpha="40%">'
    time_temp += f"{dat.strftime('%H:%M')}: {response['hourly']['temperature_2m'][i]} {temp_unit}"
    if i == temp_idx:
        time_temp += "</span>"
    if i < len(times) - 1:
        time_temp += "\n"

print(
    json.dumps(
        {
            "text": f"{response['hourly']['temperature_2m'][temp_idx]} {temp_unit}",
            "class": "weather",
            "tooltip": time_temp,
        },
        ensure_ascii=False,
    )
)
