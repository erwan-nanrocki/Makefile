/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   say_goodbye.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/23 23:54:46 by enanrock          #+#    #+#             */
/*   Updated: 2018/05/10 13:08:50 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "say_goodbye.h"

void	say_goodbye(char *name)
{
	if (name == NULL)
	{
		ft_putendl_fd("\033[31m""error""\033[m"" : (null) pointer", 2);
	}
	else
	{
		ft_putstr("goodbye ");
		ft_putstr(name);
		ft_putendl(" !");
	}
}
