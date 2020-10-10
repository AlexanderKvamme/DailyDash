//
//  WeatherHour.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 10/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation

struct Summary: Codable {
    var symbolCode: String?
}

struct Next12Hours: Codable {
    var summary: Summary?
}

struct WDetails: Codable {
    var airTemperature: Double?
    var windSpeed: Double?
    var humidity: Double?
}

extension WDetails {
    static var dummy = """
            {
              "air_pressure_at_sea_level": 1017.1,
              "air_temperature": 10,
              "cloud_area_fraction": 100,
              "relative_humidity": 54.4,
              "wind_from_direction": 82.6,
              "wind_speed": 6.8
            }
    """
}

struct WeatherData: Codable {
    var instant: WDetails?
    var next1Hours: Summary?
    var next6Hours: Summary?
    var next12Hours: Summary?
}

struct Weather: Codable {
    var time: String
    var data: WeatherData
}


struct YrProperties: Codable {
    // var meta
    var timeSeries: [Weather]?
}

struct YrCompactResponse: Codable {
    // var geometry
    var properties: YrProperties
}

extension YrCompactResponse {
    static let dummy =  """
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [
          0,
          51.5,
          4
        ]
      },
      "properties": {
        "meta": {
          "updated_at": "2020-10-10T08:48:29Z",
          "units": {
            "air_pressure_at_sea_level": "hPa",
            "air_temperature": "celsius",
            "cloud_area_fraction": "%",
            "precipitation_amount": "mm",
            "relative_humidity": "%",
            "wind_from_direction": "degrees",
            "wind_speed": "m/s"
          }
        },
        "timeseries": [
          {
            "time": "2020-10-10T11:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.9,
                  "air_temperature": 12.6,
                  "cloud_area_fraction": 93,
                  "relative_humidity": 67,
                  "wind_from_direction": 280.6,
                  "wind_speed": 8.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                },
                "details": {
                  "precipitation_amount": 0.9
                }
              }
            }
          },
          {
            "time": "2020-10-10T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.6,
                  "air_temperature": 12.7,
                  "cloud_area_fraction": 98.4,
                  "relative_humidity": 68.4,
                  "wind_from_direction": 279.5,
                  "wind_speed": 7.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.5
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rainshowers_day"
                },
                "details": {
                  "precipitation_amount": 1
                }
              }
            }
          },
          {
            "time": "2020-10-10T13:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.5,
                  "air_temperature": 11.8,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 75.5,
                  "wind_from_direction": 278.3,
                  "wind_speed": 6.5
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                },
                "details": {
                  "precipitation_amount": 0.6
                }
              }
            }
          },
          {
            "time": "2020-10-10T14:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.2,
                  "air_temperature": 11.4,
                  "cloud_area_fraction": 46.9,
                  "relative_humidity": 80.5,
                  "wind_from_direction": 277.7,
                  "wind_speed": 6.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                },
                "details": {
                  "precipitation_amount": 0.6
                }
              }
            }
          },
          {
            "time": "2020-10-10T15:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.1,
                  "air_temperature": 12.4,
                  "cloud_area_fraction": 35.2,
                  "relative_humidity": 73.9,
                  "wind_from_direction": 287.4,
                  "wind_speed": 7.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                },
                "details": {
                  "precipitation_amount": 0.7
                }
              }
            }
          },
          {
            "time": "2020-10-10T16:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.1,
                  "air_temperature": 12.1,
                  "cloud_area_fraction": 57.8,
                  "relative_humidity": 76.2,
                  "wind_from_direction": 284.6,
                  "wind_speed": 5.9
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                },
                "details": {
                  "precipitation_amount": 0.7
                }
              }
            }
          },
          {
            "time": "2020-10-10T17:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.3,
                  "air_temperature": 11.3,
                  "cloud_area_fraction": 57,
                  "relative_humidity": 80,
                  "wind_from_direction": 286.3,
                  "wind_speed": 4.5
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                },
                "details": {
                  "precipitation_amount": 0.6
                }
              }
            }
          },
          {
            "time": "2020-10-10T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.7,
                  "air_temperature": 10.6,
                  "cloud_area_fraction": 38.3,
                  "relative_humidity": 83.4,
                  "wind_from_direction": 289.6,
                  "wind_speed": 4.6
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0.5
                }
              }
            }
          },
          {
            "time": "2020-10-10T19:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.2,
                  "air_temperature": 10,
                  "cloud_area_fraction": 61.7,
                  "relative_humidity": 86.1,
                  "wind_from_direction": 306.7,
                  "wind_speed": 4.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0.3
                }
              }
            }
          },
          {
            "time": "2020-10-10T20:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.4,
                  "air_temperature": 9.7,
                  "cloud_area_fraction": 65.6,
                  "relative_humidity": 88.5,
                  "wind_from_direction": 307.6,
                  "wind_speed": 3.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              }
            }
          },
          {
            "time": "2020-10-10T21:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.6,
                  "air_temperature": 9.4,
                  "cloud_area_fraction": 46.9,
                  "relative_humidity": 90.9,
                  "wind_from_direction": 307.7,
                  "wind_speed": 3.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-10T22:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.9,
                  "air_temperature": 8.9,
                  "cloud_area_fraction": 18,
                  "relative_humidity": 93.2,
                  "wind_from_direction": 300.4,
                  "wind_speed": 3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-10T23:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.1,
                  "air_temperature": 8.1,
                  "cloud_area_fraction": 16.4,
                  "relative_humidity": 94.1,
                  "wind_from_direction": 299.5,
                  "wind_speed": 2.6
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.1,
                  "air_temperature": 7.7,
                  "cloud_area_fraction": 4.7,
                  "relative_humidity": 94.3,
                  "wind_from_direction": 297.7,
                  "wind_speed": 2.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T01:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.1,
                  "air_temperature": 7.3,
                  "cloud_area_fraction": 5.5,
                  "relative_humidity": 94.9,
                  "wind_from_direction": 296.4,
                  "wind_speed": 2.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T02:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.2,
                  "air_temperature": 7,
                  "cloud_area_fraction": 22.7,
                  "relative_humidity": 95,
                  "wind_from_direction": 299.4,
                  "wind_speed": 2.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T03:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023,
                  "air_temperature": 7,
                  "cloud_area_fraction": 21.9,
                  "relative_humidity": 95.1,
                  "wind_from_direction": 301.2,
                  "wind_speed": 2.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T04:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.3,
                  "air_temperature": 6.9,
                  "cloud_area_fraction": 6.2,
                  "relative_humidity": 94.9,
                  "wind_from_direction": 301.8,
                  "wind_speed": 2.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T05:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.6,
                  "air_temperature": 6.5,
                  "cloud_area_fraction": 2.3,
                  "relative_humidity": 94.5,
                  "wind_from_direction": 300.6,
                  "wind_speed": 2.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "clearsky_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.9,
                  "air_temperature": 6.4,
                  "cloud_area_fraction": 3.1,
                  "relative_humidity": 94.2,
                  "wind_from_direction": 295.4,
                  "wind_speed": 2.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T07:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1024.4,
                  "air_temperature": 6.8,
                  "cloud_area_fraction": 7,
                  "relative_humidity": 92.5,
                  "wind_from_direction": 300.6,
                  "wind_speed": 2.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T08:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1024.7,
                  "air_temperature": 8.3,
                  "cloud_area_fraction": 0,
                  "relative_humidity": 88.1,
                  "wind_from_direction": 306.2,
                  "wind_speed": 2.8
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T09:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.1,
                  "air_temperature": 9.7,
                  "cloud_area_fraction": 0.8,
                  "relative_humidity": 81.8,
                  "wind_from_direction": 323.1,
                  "wind_speed": 3.9
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T10:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.3,
                  "air_temperature": 10.8,
                  "cloud_area_fraction": 3.9,
                  "relative_humidity": 75.8,
                  "wind_from_direction": 335.3,
                  "wind_speed": 5
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T11:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.2,
                  "air_temperature": 12,
                  "cloud_area_fraction": 43,
                  "relative_humidity": 69.7,
                  "wind_from_direction": 341.7,
                  "wind_speed": 5.6
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.2,
                  "air_temperature": 12.6,
                  "cloud_area_fraction": 73.4,
                  "relative_humidity": 65,
                  "wind_from_direction": 342.3,
                  "wind_speed": 5.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T13:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.2,
                  "air_temperature": 12.8,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 62.1,
                  "wind_from_direction": 343.2,
                  "wind_speed": 5.6
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T14:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025,
                  "air_temperature": 13,
                  "cloud_area_fraction": 87.5,
                  "relative_humidity": 60.5,
                  "wind_from_direction": 343.5,
                  "wind_speed": 5.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T15:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.2,
                  "air_temperature": 12.8,
                  "cloud_area_fraction": 73.4,
                  "relative_humidity": 61.1,
                  "wind_from_direction": 341,
                  "wind_speed": 5.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T16:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.4,
                  "air_temperature": 12.2,
                  "cloud_area_fraction": 38.3,
                  "relative_humidity": 66.5,
                  "wind_from_direction": 335.5,
                  "wind_speed": 4.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T17:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.7,
                  "air_temperature": 11.2,
                  "cloud_area_fraction": 30.5,
                  "relative_humidity": 70.7,
                  "wind_from_direction": 328.1,
                  "wind_speed": 3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026,
                  "air_temperature": 9.7,
                  "cloud_area_fraction": 7,
                  "relative_humidity": 76.1,
                  "wind_from_direction": 328.5,
                  "wind_speed": 2.5
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T19:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026.2,
                  "air_temperature": 8.2,
                  "cloud_area_fraction": 0.8,
                  "relative_humidity": 81.9,
                  "wind_from_direction": 319.1,
                  "wind_speed": 2.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T20:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026.5,
                  "air_temperature": 7.2,
                  "cloud_area_fraction": 12.5,
                  "relative_humidity": 85.6,
                  "wind_from_direction": 302.6,
                  "wind_speed": 2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T21:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026.6,
                  "air_temperature": 6.4,
                  "cloud_area_fraction": 15.6,
                  "relative_humidity": 88.8,
                  "wind_from_direction": 286.9,
                  "wind_speed": 1.9
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T22:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026.5,
                  "air_temperature": 5.8,
                  "cloud_area_fraction": 19.5,
                  "relative_humidity": 91.2,
                  "wind_from_direction": 282.5,
                  "wind_speed": 2.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-11T23:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026.2,
                  "air_temperature": 5,
                  "cloud_area_fraction": 50,
                  "relative_humidity": 94,
                  "wind_from_direction": 287.1,
                  "wind_speed": 2.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "fair_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1026,
                  "air_temperature": 5.2,
                  "cloud_area_fraction": 18,
                  "relative_humidity": 94.3,
                  "wind_from_direction": 280.8,
                  "wind_speed": 1.8
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T01:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.8,
                  "air_temperature": 5,
                  "cloud_area_fraction": 79.7,
                  "relative_humidity": 95.4,
                  "wind_from_direction": 268.5,
                  "wind_speed": 1.8
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T02:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1025.1,
                  "air_temperature": 4.7,
                  "cloud_area_fraction": 94.5,
                  "relative_humidity": 96.2,
                  "wind_from_direction": 245.4,
                  "wind_speed": 1.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T03:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1024.5,
                  "air_temperature": 5.1,
                  "cloud_area_fraction": 96.1,
                  "relative_humidity": 96,
                  "wind_from_direction": 237.9,
                  "wind_speed": 1.8
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "clearsky_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T04:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1024.3,
                  "air_temperature": 5.4,
                  "cloud_area_fraction": 8.6,
                  "relative_humidity": 95.7,
                  "wind_from_direction": 249.9,
                  "wind_speed": 2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T05:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1024,
                  "air_temperature": 4.6,
                  "cloud_area_fraction": 60.9,
                  "relative_humidity": 97.8,
                  "wind_from_direction": 243.2,
                  "wind_speed": 2.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-12T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1023.6,
                  "air_temperature": 4.2,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 98.3,
                  "wind_from_direction": 237.7,
                  "wind_speed": 2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-12T07:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.9,
                  "air_temperature": 5.6,
                  "cloud_area_fraction": 92.2,
                  "relative_humidity": 94.4,
                  "wind_from_direction": 224.6,
                  "wind_speed": 2.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              }
            }
          },
          {
            "time": "2020-10-12T08:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.5,
                  "air_temperature": 7,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 87.4,
                  "wind_from_direction": 233.5,
                  "wind_speed": 2.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              }
            }
          },
          {
            "time": "2020-10-12T09:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1022.1,
                  "air_temperature": 8.6,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 81.1,
                  "wind_from_direction": 237.3,
                  "wind_speed": 2.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.4
                }
              }
            }
          },
          {
            "time": "2020-10-12T10:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.4,
                  "air_temperature": 9.1,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 79,
                  "wind_from_direction": 222.4,
                  "wind_speed": 2.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "rain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 1.2
                }
              }
            }
          },
          {
            "time": "2020-10-12T11:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.3,
                  "air_temperature": 9.6,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 76.9,
                  "wind_from_direction": 196.1,
                  "wind_speed": 2.5
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "rain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 1.9
                }
              }
            }
          },
          {
            "time": "2020-10-12T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1019.1,
                  "air_temperature": 10.3,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 74.1,
                  "wind_from_direction": 188.5,
                  "wind_speed": 3.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "rain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 2.6
                }
              }
            }
          },
          {
            "time": "2020-10-12T13:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1017.8,
                  "air_temperature": 10.6,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 76.3,
                  "wind_from_direction": 192.4,
                  "wind_speed": 2.9
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 3.4
                }
              }
            }
          },
          {
            "time": "2020-10-12T14:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1016.5,
                  "air_temperature": 10.9,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 79,
                  "wind_from_direction": 192.2,
                  "wind_speed": 3.4
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 4.1
                }
              }
            }
          },
          {
            "time": "2020-10-12T15:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1015.3,
                  "air_temperature": 11.1,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 80.2,
                  "wind_from_direction": 193.1,
                  "wind_speed": 3
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.8
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 4.2
                }
              }
            }
          },
          {
            "time": "2020-10-12T16:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1014.6,
                  "air_temperature": 10.6,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 88.2,
                  "wind_from_direction": 204.1,
                  "wind_speed": 2.8
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.7
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 3.4
                }
              }
            }
          },
          {
            "time": "2020-10-12T17:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1013.9,
                  "air_temperature": 10.5,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 91,
                  "wind_from_direction": 209.1,
                  "wind_speed": 2.9
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.7
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 2.7
                }
              }
            }
          },
          {
            "time": "2020-10-12T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1013.2,
                  "air_temperature": 10.6,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 91.6,
                  "wind_from_direction": 214.6,
                  "wind_speed": 2.9
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.9
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 2
                }
              }
            }
          },
          {
            "time": "2020-10-12T19:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1012.7,
                  "air_temperature": 10.5,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 92.9,
                  "wind_from_direction": 228.9,
                  "wind_speed": 2.5
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.8
                }
              }
            }
          },
          {
            "time": "2020-10-12T20:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1012.3,
                  "air_temperature": 10.5,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 94.1,
                  "wind_from_direction": 248.2,
                  "wind_speed": 2.5
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 0.3
                }
              }
            }
          },
          {
            "time": "2020-10-12T21:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1012.1,
                  "air_temperature": 10.5,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 93.9,
                  "wind_from_direction": 293.4,
                  "wind_speed": 2.9
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T22:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1011.9,
                  "air_temperature": 10.4,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 90.6,
                  "wind_from_direction": 315.1,
                  "wind_speed": 3.5
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-12T23:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1011.7,
                  "air_temperature": 9.9,
                  "cloud_area_fraction": 96.9,
                  "relative_humidity": 87.8,
                  "wind_from_direction": 305.5,
                  "wind_speed": 3.7
                }
              },
              "next_1_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-13T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1011.3,
                  "air_temperature": 9.3,
                  "cloud_area_fraction": 81.2,
                  "relative_humidity": 87,
                  "wind_from_direction": 300.8,
                  "wind_speed": 4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-13T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1009.4,
                  "air_temperature": 7.7,
                  "cloud_area_fraction": 95.3,
                  "relative_humidity": 90.2,
                  "wind_from_direction": 274.3,
                  "wind_speed": 3.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.3
                }
              }
            }
          },
          {
            "time": "2020-10-13T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1008,
                  "air_temperature": 10.2,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 84.9,
                  "wind_from_direction": 292.3,
                  "wind_speed": 3.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0.2
                }
              }
            }
          },
          {
            "time": "2020-10-13T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1008.6,
                  "air_temperature": 9.2,
                  "cloud_area_fraction": 64.8,
                  "relative_humidity": 91.2,
                  "wind_from_direction": 24.4,
                  "wind_speed": 1.6
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "rain"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rainshowers_night"
                },
                "details": {
                  "precipitation_amount": 1.3
                }
              }
            }
          },
          {
            "time": "2020-10-14T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1011.2,
                  "air_temperature": 9,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 95.8,
                  "wind_from_direction": 355.5,
                  "wind_speed": 2.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 1.3
                }
              }
            }
          },
          {
            "time": "2020-10-14T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1014.9,
                  "air_temperature": 9.3,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 92.6,
                  "wind_from_direction": 48.4,
                  "wind_speed": 3.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.5
                }
              }
            }
          },
          {
            "time": "2020-10-14T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1017.7,
                  "air_temperature": 11.8,
                  "cloud_area_fraction": 98.4,
                  "relative_humidity": 83.2,
                  "wind_from_direction": 25.2,
                  "wind_speed": 4.5
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rainshowers_day"
                },
                "details": {
                  "precipitation_amount": 1.6
                }
              }
            }
          },
          {
            "time": "2020-10-14T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1019.1,
                  "air_temperature": 9.4,
                  "cloud_area_fraction": 67.2,
                  "relative_humidity": 91.2,
                  "wind_from_direction": 18.3,
                  "wind_speed": 2.9
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.5
                }
              }
            }
          },
          {
            "time": "2020-10-15T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.6,
                  "air_temperature": 9.2,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 92.7,
                  "wind_from_direction": 25.2,
                  "wind_speed": 3.8
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-15T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021,
                  "air_temperature": 6.9,
                  "cloud_area_fraction": 49.2,
                  "relative_humidity": 94.4,
                  "wind_from_direction": 6.7,
                  "wind_speed": 2.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-15T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.6,
                  "air_temperature": 12.6,
                  "cloud_area_fraction": 93,
                  "relative_humidity": 56.6,
                  "wind_from_direction": 26.8,
                  "wind_speed": 5.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-15T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021,
                  "air_temperature": 9.7,
                  "cloud_area_fraction": 99.2,
                  "relative_humidity": 68.6,
                  "wind_from_direction": 7.6,
                  "wind_speed": 3.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-16T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.7,
                  "air_temperature": 8.8,
                  "cloud_area_fraction": 95.3,
                  "relative_humidity": 77.8,
                  "wind_from_direction": 354.3,
                  "wind_speed": 3.3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "lightrain"
                },
                "details": {
                  "precipitation_amount": 0.9
                }
              }
            }
          },
          {
            "time": "2020-10-16T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1019.3,
                  "air_temperature": 8.7,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 90.4,
                  "wind_from_direction": 0.3,
                  "wind_speed": 4.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "lightrainshowers_day"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "rain"
                },
                "details": {
                  "precipitation_amount": 1.9
                }
              }
            }
          },
          {
            "time": "2020-10-16T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020,
                  "air_temperature": 11.7,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 83.1,
                  "wind_from_direction": 23.5,
                  "wind_speed": 3.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-16T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.4,
                  "air_temperature": 9.5,
                  "cloud_area_fraction": 21.9,
                  "relative_humidity": 71.2,
                  "wind_from_direction": 33.7,
                  "wind_speed": 2.7
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-17T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1021.2,
                  "air_temperature": 8.2,
                  "cloud_area_fraction": 70.3,
                  "relative_humidity": 97.1,
                  "wind_from_direction": 36.5,
                  "wind_speed": 2.2
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-17T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.6,
                  "air_temperature": 8.5,
                  "cloud_area_fraction": 72.7,
                  "relative_humidity": 88.7,
                  "wind_from_direction": 38.5,
                  "wind_speed": 3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-17T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.8,
                  "air_temperature": 12.1,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 71.5,
                  "wind_from_direction": 82.6,
                  "wind_speed": 4.9
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-17T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1020.5,
                  "air_temperature": 9.1,
                  "cloud_area_fraction": 48.4,
                  "relative_humidity": 81.6,
                  "wind_from_direction": 73.5,
                  "wind_speed": 2.1
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-18T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1019.9,
                  "air_temperature": 8.4,
                  "cloud_area_fraction": 91.4,
                  "relative_humidity": 91.3,
                  "wind_from_direction": 48.2,
                  "wind_speed": 3
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-18T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1018.4,
                  "air_temperature": 7.7,
                  "cloud_area_fraction": 66.4,
                  "relative_humidity": 65.7,
                  "wind_from_direction": 70.1,
                  "wind_speed": 3.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-18T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1017.1,
                  "air_temperature": 10,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 54.4,
                  "wind_from_direction": 82.6,
                  "wind_speed": 6.8
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_day"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-18T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1015,
                  "air_temperature": 7.9,
                  "cloud_area_fraction": 53.9,
                  "relative_humidity": 65.1,
                  "wind_from_direction": 64.6,
                  "wind_speed": 4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-19T00:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1013.6,
                  "air_temperature": 8.3,
                  "cloud_area_fraction": 84.4,
                  "relative_humidity": 77.6,
                  "wind_from_direction": 76.1,
                  "wind_speed": 4.4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "partlycloudy_night"
                },
                "details": {
                  "precipitation_amount": 0.1
                }
              }
            }
          },
          {
            "time": "2020-10-19T06:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1012.6,
                  "air_temperature": 8.5,
                  "cloud_area_fraction": 84.4,
                  "relative_humidity": 83.6,
                  "wind_from_direction": 84.3,
                  "wind_speed": 4
                }
              },
              "next_12_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-19T12:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1013.4,
                  "air_temperature": 12.8,
                  "cloud_area_fraction": 98.4,
                  "relative_humidity": 71.6,
                  "wind_from_direction": 96,
                  "wind_speed": 4.9
                }
              },
              "next_6_hours": {
                "summary": {
                  "symbol_code": "cloudy"
                },
                "details": {
                  "precipitation_amount": 0
                }
              }
            }
          },
          {
            "time": "2020-10-19T18:00:00Z",
            "data": {
              "instant": {
                "details": {
                  "air_pressure_at_sea_level": 1014.3,
                  "air_temperature": 10.4,
                  "cloud_area_fraction": 100,
                  "relative_humidity": 83.7,
                  "wind_from_direction": 65.1,
                  "wind_speed": 3.7
                }
              }
            }
          }
        ]
      }
    }
    """

}

// ???
struct Timeseries: Codable {
    
    
}

extension Weather {
    static let dummy = """
      {
        "time": "2020-10-18T12:00:00Z",
        "data": {
          "instant": {
            "details": {
              "air_pressure_at_sea_level": 1017.1,
              "air_temperature": 10,
              "cloud_area_fraction": 100,
              "relative_humidity": 54.4,
              "wind_from_direction": 82.6,
              "wind_speed": 6.8
            }
          },
          "next_12_hours": {
            "summary": {
              "symbol_code": "partlycloudy_night"
            }
          },
          "next_6_hours": {
            "summary": {
              "symbol_code": "partlycloudy_day"
            },
            "details": {
              "precipitation_amount": 0
            }
          }
        }
      }
    """
}
 
