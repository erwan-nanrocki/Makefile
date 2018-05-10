# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    farewell.mk                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: enanrock <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/10 13:06:30 by enanrock          #+#    #+#              #
#    Updated: 2018/05/10 16:48:58 by enanrock         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE_001	:= main say_goodbye \
	arg_error null_error

SRC_DIR_001		:= $(addprefix $(HERE_001), sources/)
OBJ_DIR_001		:= $(addprefix $(HERE_001), objects/)
HDR_DIR_001		:= $(addprefix $(HERE_001), includes/)
DEP_DIR_001		:= $(addprefix $(HERE_001), dependencies/)

SRC_001			:= $(addprefix $(SRC_DIR_001), $(addsuffix .c, $(FILE_001)))
OBJ_001			:= $(addprefix $(OBJ_DIR_001), $(addsuffix .o, $(FILE_001)))
DEP_001			:= $(addprefix $(DEP_DIR_001), $(addsuffix .d, $(FILE_001)))

SRCS_DIR		+= $(SRC_DIR_001)
OBJS_DIR		+= $(OBJ_DIR_001)
HDRS_DIR		+= $(HDR_DIR_001)
DEPS_DIR		+= $(DEP_DIR_001)

OBJS			+= $(OBJ_001)
DEPS			+= $(DEP_001)

LIB_FLAGS_001	:= -L$(LIBFT_DIR) -lft

GCC_FLAGS_001	:= -Wall -Wextra -Werror -I$(HDR_DIR_001) -I$(LIBFT_DIR)

$(NAME_001): $(LIBFT_DIR)libft.a $(OBJ_001)
	@gcc $(GCC_FLAGS_001) $(LIB_FLAGS_001) $^ -o $@
	@echo "\033[1;39m""created : ""\033[0;32m""$@""\033[m"
	@echo "\033[1;36m""flags i use are ""\033[0;36m""$(GCC_FLAGS_001)""\033[m"
	@echo "\033[1;36m""and ""\033[0;36m""$(LIB_FLAGS_001)""\033[1;36m too, \c"
	@echo "but only when i link \033[7m"" $@ ""\033[m"

$(DEP_DIR_001)%.d: $(SRC_DIR_001)%.c $(SRC_DIR_001) $(HDR_DIR_001)
	@mkdir -p $(DEP_DIR_001) 2> /tmp/a.del
	@mkdir -p $(OBJ_DIR_001) 2> /tmp/a.del
	@gcc $(GCC_FLAGS_001) -MM $< -MT $(<:$(SRC_DIR_001)%.c=$(OBJ_DIR_001)%.o)>$@
	@echo "	@gcc $(GCC_FLAGS_001) -c $<""\c"                         >> $@
	@echo " -o $(<:$(SRC_DIR_001)%.c=$(OBJ_DIR_001)%.o)"             >> $@
	@echo "	@echo \"\\033[1;39m\"\"created : \"\"\\\033[0;33m\"\"\c" >> $@
	@echo "$(<:$(SRC_DIR_001)%.c=$(OBJ_DIR_001)%.o)\"\c"             >> $@
	@echo "\"\\\033[m\""                                             >> $@
	@echo ""                                                         >> $@
	@echo "\033[1;39m""\033[7m""created : $@ ""\033[m"

-include $(DEP_001)
