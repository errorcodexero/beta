H_FILES=*.h */*.h
CXX_FLAGS=-Wall -Wextra -Werror -std=c++0x
.PHONY: clean

all: util_jag_interface_test util_bound_tracker_test util_util_test util_point_test util_posedge_trigger_test util_perf_tracker_test util_countdown_timer_test util_countup_timer_test util_driver_station_interface_test util_negedge_trigger_test util_interface_test control_fire_control_test control_force_interface_test control_gyro_tracker_test control_holonomic_test control_injector_arms_test control_monitor_test control_toplevel_mode_test control_bist_test control_bunny_launcher_test control_ejector_test control_toplevel_test control_collector_tilt_test control_injector_test control_shooter_status_test control_pump_test control_wheelrpms_test control_control_status_test control_pump_advanced_test control_shooter_wheels_test control_octocanum_test control_collector_test control_wheel_sim_test control_main_test control_calibration_target_test control_lcd_scroller_test input_panel2014_test input_util_test input_cyborg_joystick_test 
%.o: %.cpp ${H_FILES}
	$(CXX) $(CXX_FLAGS) -c $(basename $@).cpp -o $@

util_jag_interface_test: ${H_FILES} util/util.o util/jag_interface.cpp util/util.o
	$(CXX) $(CXX_FLAGS) -DJAG_INTERFACE_TEST util/util.o util/jag_interface.cpp -o test_jag_interface
	./test_jag_interface

util_bound_tracker_test: ${H_FILES} util/util.o util/bound_tracker.cpp 
	$(CXX) $(CXX_FLAGS) -DBOUND_TRACKER_TEST  util/bound_tracker.cpp -o test_bound_tracker
	./test_bound_tracker

util_util_test: ${H_FILES} util/util.o util/util.cpp util/point.o
	$(CXX) $(CXX_FLAGS) -DUTIL_TEST util/point.o util/util.cpp -o test_util
	./test_util

util_point_test: ${H_FILES} util/util.o util/point.cpp 
	$(CXX) $(CXX_FLAGS) -DPOINT_TEST  util/point.cpp -o test_point
	./test_point

util_posedge_trigger_test: ${H_FILES} util/util.o util/posedge_trigger.cpp 
	$(CXX) $(CXX_FLAGS) -DPOSEDGE_TRIGGER_TEST  util/posedge_trigger.cpp -o test_posedge_trigger
	./test_posedge_trigger

util_perf_tracker_test: ${H_FILES} util/util.o util/perf_tracker.cpp 
	$(CXX) $(CXX_FLAGS) -DPERF_TRACKER_TEST  util/perf_tracker.cpp -o test_perf_tracker
	./test_perf_tracker

util_countdown_timer_test: ${H_FILES} util/util.o util/countdown_timer.cpp 
	$(CXX) $(CXX_FLAGS) -DCOUNTDOWN_TIMER_TEST  util/countdown_timer.cpp -o test_countdown_timer
	./test_countdown_timer

util_countup_timer_test: ${H_FILES} util/util.o util/countup_timer.cpp 
	$(CXX) $(CXX_FLAGS) -DCOUNTUP_TIMER_TEST  util/countup_timer.cpp -o test_countup_timer
	./test_countup_timer

util_driver_station_interface_test: ${H_FILES} util/util.o util/driver_station_interface.cpp util/util.o
	$(CXX) $(CXX_FLAGS) -DDRIVER_STATION_INTERFACE_TEST util/util.o util/driver_station_interface.cpp -o test_driver_station_interface
	./test_driver_station_interface

util_negedge_trigger_test: ${H_FILES} util/util.o util/negedge_trigger.cpp 
	$(CXX) $(CXX_FLAGS) -DNEGEDGE_TRIGGER_TEST  util/negedge_trigger.cpp -o test_negedge_trigger
	./test_negedge_trigger

util_interface_test: ${H_FILES} util/util.o util/interface.cpp util/jag_interface.o util/driver_station_interface.o util/util.o
	$(CXX) $(CXX_FLAGS) -DINTERFACE_TEST util/jag_interface.o util/driver_station_interface.o util/util.o util/interface.cpp -o test_interface
	./test_interface

control_fire_control_test: ${H_FILES} util/util.o control/fire_control.cpp control/control_status.o
	$(CXX) $(CXX_FLAGS) -DFIRE_CONTROL_TEST control/control_status.o control/fire_control.cpp -o test_fire_control
	./test_fire_control

control_force_interface_test: ${H_FILES} util/util.o control/force_interface.cpp util/posedge_trigger.o control/force.o util/interface.o util/util.o util/jag_interface.o util/driver_station_interface.o
	$(CXX) $(CXX_FLAGS) -DFORCE_INTERFACE_TEST util/posedge_trigger.o control/force.o util/interface.o util/util.o util/jag_interface.o util/driver_station_interface.o control/force_interface.cpp -o test_force_interface
	./test_force_interface

control_gyro_tracker_test: ${H_FILES} util/util.o control/gyro_tracker.cpp util/point.o
	$(CXX) $(CXX_FLAGS) -DGYRO_TRACKER_TEST util/point.o control/gyro_tracker.cpp -o test_gyro_tracker
	./test_gyro_tracker

control_holonomic_test: ${H_FILES} util/util.o control/holonomic.cpp util/point.o
	$(CXX) $(CXX_FLAGS) -DHOLONOMIC_TEST util/point.o control/holonomic.cpp -o test_holonomic
	./test_holonomic

control_injector_arms_test: ${H_FILES} util/util.o control/injector_arms.cpp util/countup_timer.o
	$(CXX) $(CXX_FLAGS) -DINJECTOR_ARMS_TEST util/countup_timer.o control/injector_arms.cpp -o test_injector_arms
	./test_injector_arms

control_monitor_test: ${H_FILES} util/util.o control/monitor.cpp control/toplevel.o util/interface.o util/jag_interface.o control/gyro_tracker.o control/collector_tilt.o control/injector.o control/injector_arms.o control/ejector.o control/shooter_status.o control/pump.o util/posedge_toggle.o control/force_interface.o control/control_status.o control/holonomic.o util/driver_station_interface.o util/util.o control/shooter_wheels.o util/countup_timer.o control/force.o util/posedge_trigger.o util/point.o control/wheelrpms.o control/collector.o util/negedge_trigger.o
	$(CXX) $(CXX_FLAGS) -DMONITOR_TEST control/toplevel.o util/interface.o util/jag_interface.o control/gyro_tracker.o control/collector_tilt.o control/injector.o control/injector_arms.o control/ejector.o control/shooter_status.o control/pump.o util/posedge_toggle.o control/force_interface.o control/control_status.o control/holonomic.o util/driver_station_interface.o util/util.o control/shooter_wheels.o util/countup_timer.o control/force.o util/posedge_trigger.o util/point.o control/wheelrpms.o control/collector.o util/negedge_trigger.o control/monitor.cpp -o test_monitor
	./test_monitor

control_toplevel_mode_test: ${H_FILES} util/util.o control/toplevel_mode.cpp control/shooter_status.o control/shooter_wheels.o util/jag_interface.o util/util.o control/toplevel.o control/ejector.o control/injector.o control/injector_arms.o util/countup_timer.o control/collector_tilt.o control/pump.o control/wheelrpms.o control/collector.o util/posedge_trigger.o util/negedge_trigger.o control/holonomic.o util/point.o
	$(CXX) $(CXX_FLAGS) -DTOPLEVEL_MODE_TEST control/shooter_status.o control/shooter_wheels.o util/jag_interface.o util/util.o control/toplevel.o control/ejector.o control/injector.o control/injector_arms.o util/countup_timer.o control/collector_tilt.o control/pump.o control/wheelrpms.o control/collector.o util/posedge_trigger.o util/negedge_trigger.o control/holonomic.o util/point.o control/toplevel_mode.cpp -o test_toplevel_mode
	./test_toplevel_mode

control_bist_test: ${H_FILES} util/util.o control/bist.cpp util/countup_timer.o control/holonomic.o control/toplevel.o control/shooter_wheels.o control/collector_tilt.o control/injector.o control/injector_arms.o control/collector.o util/posedge_trigger.o util/negedge_trigger.o control/ejector.o control/pump.o util/point.o control/shooter_status.o control/wheelrpms.o util/interface.o util/jag_interface.o util/driver_station_interface.o util/util.o
	$(CXX) $(CXX_FLAGS) -DBIST_TEST util/countup_timer.o control/holonomic.o control/toplevel.o control/shooter_wheels.o control/collector_tilt.o control/injector.o control/injector_arms.o control/collector.o util/posedge_trigger.o util/negedge_trigger.o control/ejector.o control/pump.o util/point.o control/shooter_status.o control/wheelrpms.o util/interface.o util/jag_interface.o util/driver_station_interface.o util/util.o control/bist.cpp -o test_bist
	./test_bist

control_bunny_launcher_test: ${H_FILES} util/util.o control/bunny_launcher.cpp 
	$(CXX) $(CXX_FLAGS) -DBUNNY_LAUNCHER_TEST  control/bunny_launcher.cpp -o test_bunny_launcher
	./test_bunny_launcher

control_ejector_test: ${H_FILES} util/util.o control/ejector.cpp util/countup_timer.o
	$(CXX) $(CXX_FLAGS) -DEJECTOR_TEST util/countup_timer.o control/ejector.cpp -o test_ejector
	./test_ejector

control_toplevel_test: ${H_FILES} util/util.o control/toplevel.cpp control/shooter_status.o control/wheelrpms.o control/collector.o control/collector_tilt.o control/injector.o control/injector_arms.o control/shooter_wheels.o util/posedge_trigger.o util/negedge_trigger.o util/countup_timer.o control/ejector.o control/pump.o util/point.o control/holonomic.o util/interface.o util/jag_interface.o util/driver_station_interface.o util/util.o
	$(CXX) $(CXX_FLAGS) -DTOPLEVEL_TEST control/shooter_status.o control/wheelrpms.o control/collector.o control/collector_tilt.o control/injector.o control/injector_arms.o control/shooter_wheels.o util/posedge_trigger.o util/negedge_trigger.o util/countup_timer.o control/ejector.o control/pump.o util/point.o control/holonomic.o util/interface.o util/jag_interface.o util/driver_station_interface.o util/util.o control/toplevel.cpp -o test_toplevel
	./test_toplevel

control_collector_tilt_test: ${H_FILES} util/util.o control/collector_tilt.cpp util/countup_timer.o
	$(CXX) $(CXX_FLAGS) -DCOLLECTOR_TILT_TEST util/countup_timer.o control/collector_tilt.cpp -o test_collector_tilt
	./test_collector_tilt

control_injector_test: ${H_FILES} util/util.o control/injector.cpp util/countup_timer.o
	$(CXX) $(CXX_FLAGS) -DINJECTOR_TEST util/countup_timer.o control/injector.cpp -o test_injector
	./test_injector

control_shooter_status_test: ${H_FILES} util/util.o control/shooter_status.cpp util/util.o
	$(CXX) $(CXX_FLAGS) -DSHOOTER_STATUS_TEST util/util.o control/shooter_status.cpp -o test_shooter_status
	./test_shooter_status

control_pump_test: ${H_FILES} util/util.o control/pump.cpp 
	$(CXX) $(CXX_FLAGS) -DPUMP_TEST  control/pump.cpp -o test_pump
	./test_pump

control_wheelrpms_test: ${H_FILES} util/util.o control/wheelrpms.cpp control/shooter_wheels.o control/shooter_status.o util/jag_interface.o util/posedge_trigger.o util/util.o
	$(CXX) $(CXX_FLAGS) -DWHEELRPMS_TEST control/shooter_wheels.o control/shooter_status.o util/jag_interface.o util/posedge_trigger.o util/util.o control/wheelrpms.cpp -o test_wheelrpms
	./test_wheelrpms

control_control_status_test: ${H_FILES} util/util.o control/control_status.cpp 
	$(CXX) $(CXX_FLAGS) -DCONTROL_STATUS_TEST  control/control_status.cpp -o test_control_status
	./test_control_status

control_pump_advanced_test: ${H_FILES} util/util.o control/pump_advanced.cpp control/pump.o control/ejector.o control/injector.o control/injector_arms.o control/collector_tilt.o util/countup_timer.o
	$(CXX) $(CXX_FLAGS) -DPUMP_ADVANCED_TEST control/pump.o control/ejector.o control/injector.o control/injector_arms.o control/collector_tilt.o util/countup_timer.o control/pump_advanced.cpp -o test_pump_advanced
	./test_pump_advanced

control_shooter_wheels_test: ${H_FILES} util/util.o control/shooter_wheels.cpp control/wheelrpms.o control/shooter_status.o util/jag_interface.o util/posedge_trigger.o control/fire_control.o control/calibration_target.o util/util.o
	$(CXX) $(CXX_FLAGS) -DSHOOTER_WHEELS_TEST control/wheelrpms.o control/shooter_status.o util/jag_interface.o util/posedge_trigger.o control/fire_control.o control/calibration_target.o util/util.o control/shooter_wheels.cpp -o test_shooter_wheels
	./test_shooter_wheels

control_octocanum_test: ${H_FILES} util/util.o control/octocanum.cpp 
	$(CXX) $(CXX_FLAGS) -DOCTOCANUM_TEST  control/octocanum.cpp -o test_octocanum
	./test_octocanum

control_collector_test: ${H_FILES} util/util.o control/collector.cpp util/posedge_trigger.o util/negedge_trigger.o
	$(CXX) $(CXX_FLAGS) -DCOLLECTOR_TEST util/posedge_trigger.o util/negedge_trigger.o control/collector.cpp -o test_collector
	./test_collector

control_wheel_sim_test: ${H_FILES} util/util.o control/wheel_sim.cpp control/shooter_wheels.o control/wheelrpms.o control/shooter_status.o util/jag_interface.o util/posedge_trigger.o util/util.o util/negedge_trigger.o
	$(CXX) $(CXX_FLAGS) -DWHEEL_SIM_TEST control/shooter_wheels.o control/wheelrpms.o control/shooter_status.o util/jag_interface.o util/posedge_trigger.o util/util.o util/negedge_trigger.o control/wheel_sim.cpp -o test_wheel_sim
	./test_wheel_sim

control_main_test: ${H_FILES} util/util.o control/main.cpp control/octocanum.o control/force.o control/force_interface.o control/bunny_launcher.o control/gyro_tracker.o util/interface.o util/posedge_trigger.o util/posedge_toggle.o util/perf_tracker.o util/util.o util/countdown_timer.o util/bound_tracker.o control/holonomic.o control/toplevel.o control/injector.o control/ejector.o control/shooter_wheels.o util/point.o control/collector_tilt.o control/pump.o control/collector.o control/injector_arms.o util/countup_timer.o util/negedge_trigger.o control/fire_control.o control/control_status.o control/shooter_status.o control/wheelrpms.o input/util.o input/panel2014.o util/jag_interface.o util/driver_station_interface.o control/wheel_sim.o control/toplevel_mode.o control/monitor.o control/calibration_target.o
	$(CXX) $(CXX_FLAGS) -DMAIN_TEST control/octocanum.o control/force.o control/force_interface.o control/bunny_launcher.o control/gyro_tracker.o util/interface.o util/posedge_trigger.o util/posedge_toggle.o util/perf_tracker.o util/util.o util/countdown_timer.o util/bound_tracker.o control/holonomic.o control/toplevel.o control/injector.o control/ejector.o control/shooter_wheels.o util/point.o control/collector_tilt.o control/pump.o control/collector.o control/injector_arms.o util/countup_timer.o util/negedge_trigger.o control/fire_control.o control/control_status.o control/shooter_status.o control/wheelrpms.o input/util.o input/panel2014.o util/jag_interface.o util/driver_station_interface.o control/wheel_sim.o control/toplevel_mode.o control/monitor.o control/calibration_target.o control/main.cpp -o test_main
	./test_main

control_calibration_target_test: ${H_FILES} util/util.o control/calibration_target.cpp control/fire_control.o
	$(CXX) $(CXX_FLAGS) -DCALIBRATION_TARGET_TEST control/fire_control.o control/calibration_target.cpp -o test_calibration_target
	./test_calibration_target

control_lcd_scroller_test: ${H_FILES} util/util.o control/lcd_scroller.cpp util/posedge_trigger.o util/driver_station_interface.o util/util.o
	$(CXX) $(CXX_FLAGS) -DLCD_SCROLLER_TEST util/posedge_trigger.o util/driver_station_interface.o util/util.o control/lcd_scroller.cpp -o test_lcd_scroller
	./test_lcd_scroller

input_panel2014_test: ${H_FILES} util/util.o input/panel2014.cpp control/fire_control.o control/injector.o control/injector_arms.o control/ejector.o control/collector.o util/countup_timer.o util/posedge_trigger.o util/negedge_trigger.o control/collector_tilt.o util/driver_station_interface.o input/util.o util/util.o control/calibration_target.o
	$(CXX) $(CXX_FLAGS) -DPANEL2014_TEST control/fire_control.o control/injector.o control/injector_arms.o control/ejector.o control/collector.o util/countup_timer.o util/posedge_trigger.o util/negedge_trigger.o control/collector_tilt.o util/driver_station_interface.o input/util.o util/util.o control/calibration_target.o input/panel2014.cpp -o test_panel2014
	./test_panel2014

input_util_test: ${H_FILES} util/util.o input/util.cpp 
	$(CXX) $(CXX_FLAGS) -DINPUT_UTIL_TEST  input/util.cpp -o test_util
	./test_util

input_cyborg_joystick_test: ${H_FILES} util/util.o input/cyborg_joystick.cpp 
	$(CXX) $(CXX_FLAGS) -DCYBORG_JOYSTICK_TEST  input/cyborg_joystick.cpp -o test_cyborg_joystick
	./test_cyborg_joystick

clean:
	rm -f test_*
	find -name \*.o | xargs rm -f
