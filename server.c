/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: diodos-s <diodos-s@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/16 10:31:19 by diodos-s          #+#    #+#             */
/*   Updated: 2023/07/03 11:52:17 by diodos-s         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	sigusr_handler(int signal)
{
	static int	bit_server = 0;
	static unsigned char	c = 0;

	if (signal == SIGUSR1)
	{
		c = c | (0x01 << bit_server);
		bit_server++;
	}
	else if (signal == SIGUSR2)
		bit_server++;
	if (bit_server == 8)
	{
		ft_printf("%c", c);
		bit_server = 0;
		c = 0;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	// (void)argv;
	if (argc != 1)
	{
		ft_printf("Try <./server>\n");
		return (1);
	}
	pid = getpid();
	ft_printf("Server PID: %i\n", pid);
	ft_printf("Waiting for message from client...\n");
	while (argc == 1);
	{
		signal(SIGUSR1, sigusr_handler);
		signal(SIGUSR2, sigusr_handler);
	}
	return (0);
}