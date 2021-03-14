unit_test:
	- flutter test --coverage test/service/service_test.dart 
	- flutter test --coverage test/service/user/user_service_test.dart 
driver_test:
	- flutter drive --target=test_driver/app.dart
show-coverage:
	- genhtml coverage/lcov.info -o coverage/html
	- open coverage/html/index.html