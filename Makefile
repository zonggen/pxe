VM_NAME = pxe

.PHONY: help download console clean install start destroy undefine

help:
	@echo "Targets:"
	@echo "- download: download images"
	@echo "- install: install coreos system"
	@echo "- start: start the vm"
	@echo "- destroy: destroy the vm"
	@echo "- undefine: undefine the vm"
	@echo "- console: login to the vm console"
	@echo "- clean: clean the downloaded images"

download:
	@./download

clean:
	@./download --clean
	@sudo rm -rf /var/lib/libvirt/images/pxe*

console:
	@sudo virsh console ${VM_NAME}

install:
	@sudo virt-install --pxe --network network=default --name ${VM_NAME} --memory 4096 --disk size=10 --nographics --boot menu=on,useserial=on

start:
	@sudo virsh start ${VM_NAME}

destroy:
	@sudo virsh destroy ${VM_NAME}

undefine:
	@sudo virsh undefine ${VM_NAME}
