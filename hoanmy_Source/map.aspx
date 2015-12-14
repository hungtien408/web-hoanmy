<%@ Page Language="C#" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="map" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="assets/styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/styles/site.css" rel="stylesheet" type="text/css" />
    <link href="assets/styles/site-repond.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <script src="assets/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=vi"></script>
    <script src="assets/js/google-maps.js" type="text/javascript"></script>
    <title>THIEN PHAT VINA</title>
</head>
<body class="body-bg">
    <form id="form1" runat="server">
    <div id="contactus">
        <div class="map">
            <div class="map-content">
                <div id="map">
                </div>
            </div>
        </div> 
    </div>
    </form>
</body>
</html>
