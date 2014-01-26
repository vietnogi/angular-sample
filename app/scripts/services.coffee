'use strict'
angular.module('vevoApp').factory('Videos', ($resource) ->
  $resource 'http://api.vevo.com/mobile/v1/video/list.json?offset=:offset&max=:max&genres=:genres', { id:'@id' }, { query: { method:'GET', isArray: false }}
).factory('Genres', ($resource) -> 
  $resource 'http://api.vevo.com/mobile/v1/genre/list.json', { id:'@id' }, { query: { method:'GET', isArray: false }}
).value('version', '0.1');