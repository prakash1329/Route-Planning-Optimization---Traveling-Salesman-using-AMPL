
#!pip install geopy
from geopy.geocoders import Nominatim

#!pip install folium
import folium
import pandas as pd

data = {'Location': ['Anaheim','Berkeley','Chula Vista', 'Fresno', 'Glendale', 'Huntington Beach', 'Irvine', 'Los Angeles', 'Modesto', 'Norwalk',
                     'Oakland', 'Palmdale', 'Riverside', 'San Diego', 'Torrance'], 
        'Latitude': [33.836111, 37.871667, 32.627778, 36.75, 34.146111, 33.692778, 33.669444, 34.05, 37.661389, 33.906944, 37.804444, 34.581111, 
                     33.948056, 32.715, 33.834722], 
        'Longitude': [-117.889722, -122.272778, -117.048056, -119.766667, -118.255, -118.000278, -117.823056, -118.25, -120.994444, -118.083333, 
                      -122.270833, -118.100556, -117.396111, -117.1625, -118.341389]}

data = pd.DataFrame(data, columns = ['Location', 'Latitude', 'Longitude'])

locations = data[['Latitude', 'Longitude']]
locationlist = locations.values.tolist()

map = folium.Map(location=[36.77, -119.41], zoom_start=7)

for i in range(0, len(locationlist)):
  folium.Marker(locationlist[i], tooltip= data['Location'][i]).add_to(map)

map