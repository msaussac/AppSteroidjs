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
          $scope['parkingmsa'] = value
      )

      angular.element(document.body).bind "touchmove", (e) -> e.preventDefault()
