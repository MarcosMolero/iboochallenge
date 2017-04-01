# iboochallenge

This project is a challenge request by a company.

This iOS app communicates with the Getty Images API and follow the next requirements:

- Authentication with the API KEY provided.
- Show a list of images from Barcelona city with the title.
- For each image it shows the title (showing the complete text), a switch to mark each photo as a favourite (enabled/disabled status at all time).
- When you press on one of the photos, it must open a detail screen in which the image will be displayed in large and with higher resolution and also a switch in the state that was when the photo was selected.

The frameworks/libraries used in the app development are:

- SwiftyJSON
  - Used for parse JSON data with clear syntax.

- Alamofire
  - Used for the communication with the API.

- AlamofireImage
  - Used for show the images from url.
