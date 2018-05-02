# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: enanrock <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 06:35:09 by enanrock          #+#    #+#              #
#    Updated: 2018/05/02 15:43:14 by enanrock         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:=executable_file

FILES		:= main say_hello \
	arg_error null_error

LIBFT_DIR	:= libft/
SRC_DIR		:= sources/
OBJ_DIR		:= objects/
HDR_DIR		:= includes/
DEP_DIR		:= dependencies/

SRC			:= $(addprefix $(SRC_DIR), $(addsuffix .c, $(FILES)))
OBJ			:= $(addprefix $(OBJ_DIR), $(addsuffix .o, $(FILES)))
DEP			:= $(addprefix $(DEP_DIR), $(addsuffix .d, $(FILES)))

LIB			:= . gnl mem str put lst loop math char xtoy other
LIB_DEP		:=$(addprefix $(LIBFT_DIR), $(LIB))

LIB_FLAGS	:= -L$(LIBFT_DIR) -lft

GCC_FLAGS	:= -Wall -Wextra -Werror -I$(HDR_DIR) -I$(LIBFT_DIR)

.PHONY:		all clean fclean re reset clone where_is_malloc norme

all: author .gitmodules .gitignore $(NAME)

$(LIBFT_DIR)libft.a: $(LIB_DEP)
	@make libft.a -C $(LIBFT_DIR)

$(NAME): $(OBJ) $(LIBFT_DIR)libft.a
	@gcc $(GCC_FLAGS) $(LIB_FLAGS) $^ -o $@
	@echo "\033[0;32m""created   : $@""\033[m"
	@echo "\033[1;36m""flags i use are ""\033[0;36m""$(GCC_FLAGS)""\033[m"
	@echo "\033[1;36m""and ""\033[0;36m""$(LIB_FLAGS)""\033[1;36m"" too, ""\c"
	@echo "but only when i link $@""\033[m"

-include $(DEP)

$(DEP_DIR)%.d: $(SRC_DIR)%.c $(SRC_DIR) $(HDR_DIR)
	@mkdir -p $(DEP_DIR) 2> /tmp/a.del
	@mkdir -p $(OBJ_DIR) 2> /tmp/a.del
	@gcc $(GCC_FLAGS) -MM $< -MT $(<:$(SRC_DIR)%.c=$(OBJ_DIR)%.o)        >  $@
	@echo "	@gcc $(GCC_FLAGS) -c $< -o $(<:$(SRC_DIR)%.c=$(OBJ_DIR)%.o)" >> $@
	@echo "	@echo \"\\\033[0;33m\"\"\c"                                  >> $@
	@echo "created   : $(<:$(SRC_DIR)%.c=$(OBJ_DIR)%.o)\"\c"             >> $@
	@echo "\"\\\033[m\""                                                 >> $@
	@echo ""                                                             >> $@
	@echo "\033[7m""created   : $@ ""\033[m"

clean:
	@echo "\033[0;31m""deleted all these files :""\033[m"
	@make $@ -C $(LIBFT_DIR)
	@echo "\033[1;31m""\c"
	@rm -fv $(OBJ) | column
	@rm -dv $(OBJ_DIR) | column
	@rm -fv $(DEP) | column
	@rm -dv $(DEP_DIR) | column
	@echo "\033[m""\c"

fclean:
	@make clean
	@make $@ -C $(LIBFT_DIR)
	@echo "\033[0;31m""\c"
	@rm -fv $(NAME)
	@echo "\033[m""\c"

re:
	@make fclean
	@make all

reset:
	rm -v author .gitmodules .gitignore
	make author
	make .gitmodules
	make .gitignore

.gitmodules:
	@echo "\033[1;37m""\c"
	echo '[submodule "libft"]'                           > $@
	echo '	path = libft'                                >> $@
	echo '	url = git://github.com/erwan-nanrocki/libft' >> $@
	@echo "\033[m"

.gitignore:
	@echo "\033[1;37m""\c"
	echo "$(NAME)"    >  $@
	echo "*.a"        >> $@
	echo "$(OBJ_DIR)" >> $@
	echo "*.o"        >> $@
	echo "$(DEP_DIR)" >> $@
	echo "*.d"        >> $@
	echo "*_DONE"     >> $@
	echo "*.swp"      >> $@
	@echo "\033[m"

author:
	@echo "\033[1;37m""\c"
	echo "enanrock" > $@
	@echo "\033[m"

clone:
	git clone https://github.com/erwan-nanrocki/libft.git $(LIBFT_DIR)

where_is_malloc:
	@make $@ -C $(LIBFT_DIR)

norme:
	@make norme -C $(LIBFT_DIR)
	@echo "\033[1;37m""norminette on $(SRC_DIR)""\033[m"
	@norminette $(SRC_DIR)                               \
		| sed ''s/Error/`echo "\033[0;31mError"`/g''     \
		| sed ''s/Warning/`echo "\033[0;33mWarning"`/g'' \
		| sed ''s/Norme/`echo "\033[0;32mNorme"`/g''
	@echo "\033[1;37m""norminette on $(HDR_DIR)""\033[m"
	@norminette $(HDR_DIR)                               \
		| sed ''s/Error/`echo "\033[0;31mError"`/g''     \
		| sed ''s/Warning/`echo "\033[0;33mWarning"`/g'' \
		| sed ''s/Norme/`echo "\033[1;34mNorme"`/g''
	@echo "\033[m""\c"
