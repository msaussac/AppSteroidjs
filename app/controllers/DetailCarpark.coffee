'use strict'

angular.module('parkingmanagerApp')
  .controller 'DetailCarparkCtrl', ($scope, $timeout) ->
    # Bind controller data
    do ->
      $scope.text_field_with_stacked_label2 = {}

      $scope.text_field_with_stacked_label2.value = '' # default value

      $scope.text_field_with_stacked_label1 = {}

      $scope.text_field_with_stacked_label1.value = '' # default value


    # Attach listeners

    $scope.list3ListTap = ->
      do ([item] = arguments) ->
        queryString = '?id=' + item['id'] + '&idParent=' + steroids.view.params['id']
        detailParkingWebView = new steroids.views.WebView 'views/DetailParking/index.html' + queryString
        steroids.layers.push { view: detailParkingWebView }


    # Initialize controller
    do ->   

      steroids.data.reactive.whenVisible.onValue ->
        steroids.data.resource('carparkmsa')
          .findAll({  })
          .then((results) -> do (id = parseInt(steroids.view.params['id'], 10)) ->
            for result in results
              if id is result['id']
                return result
          )
          .then (result) ->
            $scope.$apply ->
              $scope['carparkmsa'] = result
              $scope['parkingmsa'] = result['parkings']
              steroids.view.navigationBar.show { title: $scope.carparkmsa.name }


      angular.element(document.body).bind "touchmove", (e) -> e.preventDefault()
