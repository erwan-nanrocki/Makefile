# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: enanrock <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 06:35:09 by enanrock          #+#    #+#              #
#    Updated: 2018/05/10 17:58:21 by enanrock         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_001	:= farewell
NAME_002	:= greeting
NAMES		:= $(NAME_001) $(NAME_002)

NAME_DIR	:= $(addsuffix _dir/, $(NAMES))
HERE_001	:= $(addsuffix _dir/, $(findstring $(NAME_001), $(NAMES)))
HERE_002	:= $(addsuffix _dir/, $(findstring $(NAME_002), $(NAMES)))

NAME_LIBFT	:= libft.a

LIBFT_DIR	:= libft/
HERE_LIBFT	:= $(LIBFT_DIR)

.PHONY:		all clean fclean re reset clone where_is_malloc norme

all: author .gitmodules .gitignore $(NAMES)

-include $(join $(NAME_DIR), $(addsuffix .mk, $(NAMES)))
-include $(addprefix $(LIBFT_DIR), $(addsuffix .mk, libft))

clean:
	@echo "\033[0;31m""deleted all these files and directory :""\033[m"
	@echo "\033[0;31m""\c"
	@rm -fv $(OBJS) | column
	@rm -dv $(OBJS_DIR) | column
	@echo "\033[1;31m""\c"
	@rm -fv $(DEPS) | column
	@rm -dv $(DEPS_DIR) | column
	@echo "\033[m""\c"

fclean:
	@make clean
	@make $@ -C $(LIBFT_DIR)
	@echo "\033[0;31m""\c"
	@rm -fv $(NAMES)
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
	echo "$(NAME_001)"		>  $@
	echo "$(NAME_002)"		>>  $@
	echo "*.a"				>> $@
	echo "$(OBJ_DIR_001)"	>> $@
	echo "$(OBJ_DIR_002)"	>> $@
	echo "$(OBJ_DIR_LIBFT)"	>> $@
	echo "*.o"				>> $@
	echo "$(DEP_DIR_001)"	>> $@
	echo "$(DEP_DIR_002)"	>> $@
	echo "*.d"				>> $@
	echo "*_DONE"			>> $@
	echo "*.swp"			>> $@
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
	@echo "\033[1;37m""norminette on $(SRCS_DIR)""\033[m"
	@norminette $(SRCS_DIR)                               \
		| sed ''s/Error/`echo "\033[0;31mError"`/g''     \
		| sed ''s/Warning/`echo "\033[0;33mWarning"`/g'' \
		| sed ''s/Norme/`echo "\033[0;32mNorme"`/g''
	@echo "\033[1;37m""norminette on $(HDRS_DIR)""\033[m"
	@norminette $(HDRS_DIR)                               \
		| sed ''s/Error/`echo "\033[0;31mError"`/g''     \
		| sed ''s/Warning/`echo "\033[0;33mWarning"`/g'' \
		| sed ''s/Norme/`echo "\033[1;34mNorme"`/g''
	@echo "\033[m""\c"
