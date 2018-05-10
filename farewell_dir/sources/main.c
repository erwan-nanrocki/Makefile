/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/23 23:35:50 by enanrock          #+#    #+#             */
/*   Updated: 2018/05/10 14:44:16 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int		main(int argc, char **argv)
{
	if (argc != 2)
	{
		arg_error(argc);
	}
	else
	{
		say_goodbye(argv[1]);
	}
	return (0);
}
