'use strict'

angular.module('parkingmanagerApp')
  .controller 'CarparkHomeCtrl', ($scope, $timeout) ->
    # Bind controller data
    do ->

    # Attach listeners

    $scope.list_testListTap = ->
      do ([item] = arguments) ->
        queryString = '?id=' + item['id']
        detailCarparkWebView = new steroids.views.WebView 'views/DetailCarpark/index.html' + queryString
        steroids.layers.push { view: detailCarparkWebView }


    # Initialize controller
    do ->
      steroids.view.navigationBar.show { title: "Title" }

      steroids.data.reactive.whenVisible.onValue ->
        steroids.data.resource('carparkmsa')
          .findAll({  })
          .then (result) ->
            $scope.$apply ->
              $scope['carparkmsa'] = result

      angular.element(document.body).bind "touchmove", (e) -> e.preventDefault()
