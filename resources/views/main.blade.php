<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Facebook</title>
        <!-- Fav Icon -->
        <link rel="shortcut icon" href="{{asset('fb_icon.png')}}" >
        <!-- Fonts -->
        <link rel="stylesheet" href="{{asset('css/app.css')}}" >

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        
        <link rel="manifest" href="{{asset('manifest.json')}}" >
    
    </head>
    <body>
       <div id="app">
          <Routeview/>
       </div>
       <script>
      window.onload = () => {
        if('serviceWorker' in navigator){
        // Register service worker
         navigator.serviceWorker.register('sw.js').then(function(reg){
            console.log("Registration OK!. Scope is "+reg.scope);
        }).catch(function(err){
            console.error("Registration FAILED! "+err);
        });
    }
}
       </script>

       <script src="https://unpkg.com/vue-slick-carousel@1.0.6/dist/vue-slick-carousel.umd.js"></script>
       <script src="{{asset('js/app.js')}}"></script>
    </body>
</html>
