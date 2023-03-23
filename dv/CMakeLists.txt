find_package(Catch2 3 REQUIRED CONFIG)

add_executable(tests)
target_sources(tests PRIVATE mem_ctrl.cpp)

nyu_link_sv(tests PRIVATE mem nyu::amba)
nyu_add_sv(tests MemCtrl_tl.sv)

nyu_target_verilate(tests
  TOP_MODULES MemCtrl_tl
)

target_link_libraries(tests PRIVATE Catch2::Catch2WithMain)

include(Catch)
catch_discover_tests(tests)
