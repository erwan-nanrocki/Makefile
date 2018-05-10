/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   say_hello.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/23 23:54:46 by enanrock          #+#    #+#             */
/*   Updated: 2018/04/24 01:04:14 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "say_hello.h"

void	say_hello(char *name)
{
	if (name == NULL)
	{
		ft_putendl_fd("\033[31m""error""\033[m"" : (null) pointer", 2);
	}
	else
	{
		ft_putstr("Hello ");
		ft_putstr(name);
		ft_putendl(" !");
	}
}
