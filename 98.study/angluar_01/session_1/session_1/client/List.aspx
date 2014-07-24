<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="client_List" %>

<!DOCTYPE html>

<html >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    
    <script src="/Scripts/angular.min.js"></script>
    <script src="/Scripts/jquery-2.1.1.min.js"></script>
</head>
    <script type="text/javascript">

        var myApp = angular.module('myApp', []);


        

        myApp.controller('MainCtrl', ['$scope', function ($scope) {

            $scope.text = 'Hello, Angular fanatic.';

        }]);

        // ------------------------------

        myApp.controller('UserCtrl', ['$scope', function ($scope) {
            $scope.user = {};
            $scope.user.details = {
                "username": '홍길동',
                "id": "hong-kil-dong"
            };

        }]);


        //-------------------------

        myApp.directive('customButton', function () {
            return {
                restrict: 'A',
                replace: true,
                transclude: true,
                template: '<a href="" class="myawesomebutton" ng-transclude>' +
                            '<i class="icon-ok-sign"></i>' +
                          '</a>',
                link: function (scope, element, attrs) {
                    // DOM 조작과 이벤트 설정은 여기서!
                    //alert('링크버튼 클릭이예요')
                }
            }
        })



        //-------------------------- JSON 바인딩 --------------------------

        myApp.controller('UserJsonCtrl', ['$scope', '$http', function ($scope, $http) {

            // 사용자 객체를 생성
            $scope.user = {};

            // 빈 문자열로 초기화
            $scope.user.username = '';
            $scope.user.userage = '';
            $scope.user.usercity = '';
            $scope.user.useraddr = '';

            $http({
                method: 'POST',
                url: '../server/AjaxSvr.aspx'
            })
            .success(function (data, status, headers, config) {
                // 성공! 데이터를 가져왔어
                alert(data[0].Name)
                $scope.user.username = data[0].Name;
                $scope.user.userage = data[0].Age;
                $scope.user.usercity = data[0].City;
                $scope.user.useraddr = data[0].Address;
            })
            .error(function (data, status, headers, config) {
              // 이런. 뭔가 잘못되었음! :(
            });
        }]);

        </script>
<body >
        <li> <input type="text" ng-model="test" /></li>
        <li> 안녕하세요 테스트 {{test}} 입니다.</li>
        <li> <input type="button" id="btn_ajax" value="get ajax" /></li>

 <div ng-app="myApp">
    <div ng-controller="MainCtrl">
         {{ text }}
    </div>
     <div ng-controller="UserCtrl">
         <p class="username"> Wellcome, {{user.details.username}}</p>
         <p class="id"> User ID, {{user.details.id}}</p>


     </div>

     <div>
        <a custom-button>Click me</a>
    </div>

    <div ng-controller="UserJsonCtrl">
        <p>===== Json Response 예제 ===== </p>
        <p> 이름 : {{user.username}}</p>
        <p> 나이 : {{user.userage}}</p>
        <p> 지역 : {{user.usercity}}</p>
        <p> 주소 : {{user.useraddr}}</p>

     </div>
</div>
</body>
</html>
