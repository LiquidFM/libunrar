#ifndef LIBUNRAR_CONFIG_H_
#define LIBUNRAR_CONFIG_H_

#ifdef LIBUNRAR_BUILD
#    define LIB_EXPORT __attribute__((visibility("default")))
#else
#    define LIB_EXPORT
#endif

#endif /* LIBUNRAR_CONFIG_H_ */
