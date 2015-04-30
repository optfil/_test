# compile options
CC = g++
CPPFLAGS = -std=c++11 -Wall

# paths and directories
OBJDIR := build
SRCDIR := src

vpath %.cpp src/lib1 src/program
vpath %.o $(OBJDIR)
vpath %.d $(OBJDIR)

# files
EXE_NAME := program.e
sources := $(wildcard $(SRCDIR)/*/*.cpp)
objects := $(addprefix $(OBJDIR)/, $(patsubst %.cpp, %.o, $(notdir $(sources))))
deps    := $(addprefix $(OBJDIR)/, $(patsubst %.cpp, %.d, $(notdir $(sources))))

# targets
all: $(EXE_NAME)

$(EXE_NAME): $(objects)
	$(CC) $(CPPFLAGS) -o $@ $^
	
$(OBJDIR)/%.o: %.cpp | $(OBJDIR)
	$(CC) $(CPPFLAGS) -o $@ -c $<
	
$(OBJDIR): 
	mkdir -p $@

$(OBJDIR)/%.d: %.cpp | $(OBJDIR)
	@set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(OBJDIR)/\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
	
-include $(deps)	
	
.PHONY: clean
clean:
	rm -rf $(OBJDIR)
	rm -f $(EXE_NAME)