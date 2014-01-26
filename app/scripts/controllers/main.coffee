'use strict'

angular.module('vevoApp')
  .controller 'MainCtrl', ['$scope', 'Videos', 'Genres', ($scope, Videos, Genres) ->
    # Defaults
    $scope.max = 40
    $scope.genres = ''
    $scope.offset = 0
    $scope.data = {
      genres: [],
      videos: []
    }

    # Get genres
    Genres.query (response) ->
      $scope.data.genres = response.result;
    
    $scope.filterOut = () ->
      $scope.genres = $('.genres').val();
      if $scope.genres != ''
        $scope.offset = 0
        $scope.data.videos = []
        $scope.showMore()

    $scope.showMore = () ->
      $('.loading').show()
      Videos.query { max: $scope.max, genres: $scope.genres, offset: $scope.offset }, (response) ->
        $('.loading').hide()
        $scope.offset += $scope.max
        $.each response.result, (i, video) ->
          $scope.data.videos.push video

    # Show the collection of videos
    $scope.showMore()
  ]
