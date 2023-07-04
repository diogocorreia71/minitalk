# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: diodos-s <diodos-s@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/04 10:27:05 by diodos-s          #+#    #+#              #
#    Updated: 2023/07/04 11:04:20 by diodos-s         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk.a

SRC_SERVER = server.c
SRC_CLIENT = client.c

OBJ_SERVER = ${SRC_SERVER:.c=.o}
OBJ_CLIENT = ${SRC_CLIENT:.c=.o}

RM = rm -f
CFLAGS = -Wall -Wextra -Werror
MAKE = make -C
LIBFT = libft/libft.a

all:	${NAME}

${NAME}:	${OBJ_SERVER} ${OBJ_CLIENT}
						${MAKE} libft
						cp ${LIBFT} ${NAME}
						ar rcs ${NAME} ${OBJ_SERVER} ${OBJ_CLIENT}
						cc ${CFLAGS} ${OBJ_SERVER} ${NAME} -o server
						cc ${CFLAGS} ${OBJ_CLIENT} ${NAME} -o client

clean:
				${MAKE} libft clean
				${RM} ${OBJ_SERVER} ${OBJ_CLIENT}

fclean:	clean
				${MAKE} libft fclean
				${RM} ${NAME} server client

re:		fclean all

.PHONY: all clean fclean re