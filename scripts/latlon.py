import os
import socket
import sys

import geopy
from geopy.geocoders import Nominatim

try:
    place = " ".join(sys.argv[1:])
    loc = Nominatim(user_agent=os.environ.get("USER"), timeout=8).geocode(place)
    print(f"{loc.latitude:.3f}, {loc.longitude:.3f}")
except AttributeError as e:
    print(f"Failed: Couldn't find place. [{e}]")
except geopy.exc.GeocoderServiceError as e:
    print(f"Failed: No Internet. [{e}]")
