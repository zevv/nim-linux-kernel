#include <stdio.h>
#include <linux/module.h>
#include <linux/slab.h>

FILE *stdout;
FILE *stderr;

size_t fwrite(void *ptr, size_t size, size_t nmemb, FILE *stream)
{
	printk(ptr);
	return 0;
}

int fflush(FILE *stream)
{
	return 0;
}

void exit(int status)
{
	for(;;);
}

void flockfile(FILE *filehandle)
{
}

void funlockfile(FILE *filehandle)
{
}

void *malloc(size_t size)
{
	return kmalloc(size, GFP_KERNEL);
}

void *realloc(void *p, size_t size)
{
	return krealloc(p, size, GFP_KERNEL);
}

void free(void *p)
{
	kfree(p);
}
