debug:
	clang++ main.cpp Network.cpp blastinfo.cpp Alignment.cpp nsga-ii.cpp localSearch.cpp -o optnetalign -stdlib=libc++ -g -Wall -std=c++11 -I /usr/local/Cellar/boost/1.53.0/include/ -L /usr/local/Cellar/boost/1.53.0/lib -lboost_thread-mt -lboost_filesystem-mt -lboost_system-mt -lboost_program_options-mt -pthread

optimized:
	clang++ main.cpp Network.cpp blastinfo.cpp Alignment.cpp nsga-ii.cpp localSearch.cpp -o optnetalign -stdlib=libc++ -O3 -Wall -std=c++11 -I /usr/local/Cellar/boost/1.53.0/include/ -L /usr/local/Cellar/boost/1.53.0/lib -lboost_thread-mt -lboost_filesystem-mt -lboost_system-mt -lboost_program_options-mt -pthread

test:
	clang++ tests.cpp blastinfo.cpp Alignment.cpp Network.cpp nsga-ii.cpp localSearch.cpp -o test -std=c++11 -I /usr/local/Cellar/boost/1.53.0/include/ -L /usr/local/Cellar/boost/1.53.0/lib -lboost_unit_test_framework-mt

ubuntu:
	icc main.cpp Network.cpp blastinfo.cpp Alignment.cpp nsga-ii.cpp localSearch.cpp -o optnetalign -prof-use -ipo -prof-dir. -use-intel-optimized-headers -tbb -par-num-threads=8 -opt-mem-layout-trans=3 -opt-subscript-in-range -ansi-alias -fno-alias -O3 -xHost -unroll-aggressive -opt-calloc -no-prec-div -Wall -std=c++11 -I /usr/include/ -L /usr/lib/x86_64-linux-gnu/ -lboost_filesystem -lboost_system -lboost_program_options -lboost_thread	


debugubuntu:
	icc main.cpp Network.cpp blastinfo.cpp Alignment.cpp nsga-ii.cpp localSearch.cpp -o optnetalign -prof-gen -prof-dir/home/connor/Drobox/profiled -tbb -ldl -Wall -std=c++11 -I /usr/include/ -L /usr/lib/x86_64-linux-gnu/ -lboost_filesystem -lboost_system -lboost_program_options -lboost_thread	


localTest:
	clang++ localTest.cpp Network.cpp blastinfo.cpp Alignment.cpp nsga-ii.cpp localSearch.cpp -o localTest -stdlib=libc++ -O3 -Wall -std=c++11 -I /usr/local/Cellar/boost/1.53.0/include/ -L /usr/local/Cellar/boost/1.53.0/lib -lboost_thread-mt -lboost_filesystem-mt -lboost_system-mt -lboost_program_options-mt -pthread
