FROM ubuntu:18.04
ENV RISCV=/opt/riscv
ENV PATH=$RISCV/bin:$PATH
WORKDIR $RISCV

RUN apt-get update && apt-get install -y autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev  && apt-get install -y git && git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

WORKDIR $RISCV/riscv-gnu-toolchain
RUN ./configure --prefix=/ --with-arch=rv32gc --with-abi=ilp32d --enable-multilib
RUN make

WORKDIR $RISCV
RUN rm -rf riscv-gnu-toolchain
CMD ["/bin/bash"]
