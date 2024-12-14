// NAME: PIETRO ANGIOLELLA SN: 220378899

ORG 0x0
a: DD 0xAAAABBBBCCCCDDDD // initialises first thing to a
b: DD 0x4444333322221111 // initialises second thing to a
DM 8 			 // adds memory (72 mem needed but starts at 16)

ld t0, 0(x0) 			// loads a (x0) into t0
ld t1, 8(x0) 			// loads b (x08) into t1

add t2, t0, t1 			// adds
sd t2, 16(x0) 			// stores into memory 16 (its 8 bytes per must start at 16)

sub t3, t0, t1 			// sub 1
sd t3, 24(x0) 			// stores into memory 24 (16+8 etc)

sub t4, t1, t0			// sub 2
sd t4, 32(x0) 			// stores into memory 32

and t5, t0, t1			// and
sd t5, 40(x0) 			// stores into memory 40

or t6, t0, t1			// or
sd t6, 48(x0) 			// stores into memory 48

xor s0, t0, t1			// xor
sd s0, 56(x0) 			// stores into memory 56

xori s2, t0, -1			// not a
sd s2, 64(x0) 			// stores into memory 64

xori s3, t1, -1 			// not b
sd s3, 72(x0) 			// stores into memory 72
