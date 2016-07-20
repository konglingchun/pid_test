SRC := #
SRC += main.cpp
SRC += pid_lib/PID_v1.cpp

CPLUS_INCLUDE_PATH = pid_lib

#OBJ := $(subst .cpp,.o,$(SRC))
OBJ = $(SRC:%.cpp=%.o)

CC = g++

DEBUG = y

CFLAGS = -Wall
CFLAGS += -I./

OPTION = -lpthread -ldl -lm

EXEC_NAME = demo
EXEC_PATH = ./$(EXEC_NAME)

ifeq ($(DEBUG), y)
	CFLAGS += -g
else
	CFLAGS += -O2
endif

export CC CFLAGS CPLUS_INCLUDE_PATH

$(EXEC_NAME):$(OBJ)
	@echo make ...
	@$(CC) $^ -o $(EXEC_PATH) $(CFLAGS) $(OPTION) 
	@echo make over
	@echo Execute target is $(EXEC_PATH)
$(OBJ):%.o:%.cpp
	$(CC) $^ -c -o $@ $(CFLAGS)

.PHONY:clean $(EXEC_NAME)
clean:
	@echo clean ...
	rm $(EXEC_PATH) $(OBJ) *.o -rf
	@echo clean over
