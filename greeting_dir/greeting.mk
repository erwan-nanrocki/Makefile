# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    greeting.mk                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: enanrock <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/10 13:06:30 by enanrock          #+#    #+#              #
#    Updated: 2018/05/10 17:26:24 by enanrock         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE_002	:= main say_hello \
	arg_error null_error

SRC_DIR_002		:= $(addprefix $(HERE_002), sources/)
OBJ_DIR_002		:= $(addprefix $(HERE_002), objects/)
HDR_DIR_002		:= $(addprefix $(HERE_002), includes/)
DEP_DIR_002		:= $(addprefix $(HERE_002), dependencies/)

SRC_002			:= $(addprefix $(SRC_DIR_002), $(addsuffix .c, $(FILE_002)))
OBJ_002			:= $(addprefix $(OBJ_DIR_002), $(addsuffix .o, $(FILE_002)))
DEP_002			:= $(addprefix $(DEP_DIR_002), $(addsuffix .d, $(FILE_002)))

SRCS_DIR		+= $(SRC_DIR_002)
OBJS_DIR		+= $(OBJ_DIR_002)
HDRS_DIR		+= $(HDR_DIR_002)
DEPS_DIR		+= $(DEP_DIR_002)

OBJS			+= $(OBJ_002)
DEPS			+= $(DEP_002)

LIB_FLAGS_002	:= -L$(LIBFT_DIR) -lft

GCC_FLAGS_002	:= -Wall -Wextra -Werror -I$(HDR_DIR_002) -I$(LIBFT_DIR)

$(NAME_002): $(LIBFT_DIR)libft.a $(OBJ_002)
	@gcc $(GCC_FLAGS_002) $(LIB_FLAGS_002) $^ -o $@
	@echo "\033[1;39m""created : ""\033[0;32m""$@""\033[m"
	@echo "\033[1;36m""flags i use are ""\033[0;36m""$(GCC_FLAGS_002)""\033[m"
	@echo "\033[1;36m""and ""\033[0;36m""$(LIB_FLAGS_002)""\033[1;36m too, \c"
	@echo "but only when i link \033[7m"" $@ ""\033[m"

$(DEP_DIR_002)%.d: $(SRC_DIR_002)%.c $(SRC_DIR_002) $(HDR_DIR_002)
	@mkdir -p $(DEP_DIR_002) 2> /tmp/a.del
	@mkdir -p $(OBJ_DIR_002) 2> /tmp/a.del
	@gcc $(GCC_FLAGS_002) -MM $< -MT $(<:$(SRC_DIR_002)%.c=$(OBJ_DIR_002)%.o)>$@
	@echo "	@gcc $(GCC_FLAGS_002) -c $<""\c"                         >> $@
	@echo " -o $(<:$(SRC_DIR_002)%.c=$(OBJ_DIR_002)%.o)"             >> $@
	@echo "	@echo \"\\033[1;39m\"\"created : \"\"\\\033[0;33m\"\"\c" >> $@
	@echo "$(<:$(SRC_DIR_002)%.c=$(OBJ_DIR_002)%.o)\"\c"             >> $@
	@echo "\"\\\033[m\""                                             >> $@
	@echo ""                                                         >> $@
	@echo "\033[1;39m""\033[7m""created : $@ ""\033[m"

-include $(DEP_002)
