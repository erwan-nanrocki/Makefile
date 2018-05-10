/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   arg_error.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/23 23:53:54 by enanrock          #+#    #+#             */
/*   Updated: 2018/04/24 02:45:14 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "arg_error.h"

void	arg_error(int argc)
{
	if (argc <= 1)
	{
		ft_putendl_fd("How are you ?", 2);
	}
	else if (argc > 2)
	{
		ft_putendl_fd("only 1 name, please", 2);
	}
}
