'use strict'

angular.module('parkingmanagerApp')
  .controller 'DetailParkingCtrl', ($scope, $timeout) ->
    # Bind controller data
    do ->
      $scope.toggle0 = {}

      $scope.toggle0.value = '' # default value


    # Attach listeners


    # Initialize controller
    do ->
      #steroids.view.navigationBar.show { title: $scope.parkingmsa.id }

      id = parseInt(steroids.view.params['id'], 10)
      idParent = parseInt(steroids.view.params['idParent'], 10)
      myRootRef = new Firebase "https://testmsa.firebaseio.com/"
      parkings = myRootRef.child('carpark/' + idParent + '/parkings/' + id) 
      parkings.on('value', (result) => 
        $scope.$apply ->
          value = result.val()
          alert(value)
          $scope['parkingmsa'] = value
      )

      #steroids.data.reactive.whenVisible.onValue ->
      #  steroids.data.resource('carparkmsa')
      #    .findAll({  })
      #    .then((results) -> do (id = parseInt(steroids.view.params['id'], 10), idParent = parseInt(steroids.view.params['idParent'], 10)) ->
      #      for result in results
      #        if idParent is result['id']
      #          parkings = result['parkings']
      #          for parking in parkings
      #            if id is parking['id']
      #              return parking
      #    )
      #    .then (result) ->
      #      $scope.$apply ->
      #        $scope['parkingmsa'] = result

      angular.element(document.body).bind "touchmove", (e) -> e.preventDefault()
