.PHONY:  clean resume

RESUME := AmrAbed

%.pdf: %.tex sections/*
	docker compose run latexmk $<
	docker compose down && docker container prune -f && docker rmi latexmk
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.fls *.fdb_latexmk  # workaroud since the -c option is not working


resume: $(RESUME).pdf
