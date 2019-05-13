###############################################################################
## Makefile
###############################################################################

# Target
TARGET     ?= usb_sniffer

# Options
CFLAGS      = 
LDFLAGS     = 
#LIBS        = -lftdi
#LIBS        = -ljtag_atlantic -ljtag_client
#LIBS        = -L. -ljtag_atlantic -ljtag_client
LIBS        = -L /opt/altera/12.1/quartus/linux64 -ljtag_atlantic -ljtag_client

ARGS       += 

# Source Files
SRC_C   = $(wildcard *.c)
SRC_CPP = $(wildcard *.cpp)
OBJ_C   = $(patsubst %.c,%.o,$(SRC_C))
OBJ_CPP = $(patsubst %.cpp,%.o,$(SRC_CPP))
SRC     = $(SRC_C) $(SRC_CPP)
OBJ     = $(OBJ_C) $(OBJ_CPP)

###############################################################################
# Rules
###############################################################################
all: $(TARGET)
    
clean:
	-rm $(OBJ) $(TARGET)

%.o : %.c
	gcc -c $(CFLAGS) $< -o $@

%.o : %.cpp
	g++ -c $(CFLAGS) $< -o $@

$(TARGET): $(OBJ)
	g++ $(LDFLAGS) $(OBJ) $(LIBS) -o $@

run: $(TARGET)
	sudo ./$(TARGET) $(ARGS)
