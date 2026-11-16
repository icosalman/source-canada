$replacements = @(
    @("article-inside-the-vial.html", "article-inside-the-synthesis.html"),
    @("Inside the Vial: A Researcher’s Guide to Peptide Identity, Purity, Quality, and Analytical Testing", "Inside the Synthesis: A Researcher’s Guide to Sequence Identity, Purity, Quality, and Analytical Testing"),
    @("Inside the Vial", "Inside the Synthesis"),
    @("A peptide vial can look deceptively simple.", "A synthesized compound specimen can look deceptively simple."),
    @("A peptide vial", "A synthesized compound"),
    @("inside the vial", "inside the analytical batch"),
    @("in this vial", "in this batch"),
    @("the vial", "the specimen"),
    @("this vial", "this specimen"),
    @("a vial labelled 10 mg", "a specimen labelled 10 mg"),
    @("vial labelled", "specimen labelled"),
    @("10 mg vial", "10 mg specimen"),
    @("total vial composition", "total specimen composition"),
    @("hypothetical vial", "hypothetical analytical sample"),
    @("Vial lot number", "Specimen lot number"),
    @("matches the vial", "matches the batch specimen"),
    @("central vial graphic", "central molecular graphic"),
    @("vials", "specimens"),
    @("vial", "specimen"),

    # CTAs & Commercial
    @("Get your Research Peptides", "Access Certified Research Sequences"),
    @("Explore Our Research Store", "Explore Verified Research Catalog"),
    @("Partner Store", "Analytical Catalog"),
    @("subscriber-only store offers", "subscriber-only analytical updates"),

    # Headings & Meta
    @("BioResearch — Peptide research, explained.", "BioResearch — Molecular Research & Synthesis, Explained."),
    @("Peptide research,<!-- --> <em", "Molecular research,<!-- --> <em"),
    @("Peptide research, <em", "Molecular research, <em"),
    @("Independent peptide science journal", "Independent molecular science journal"),
    @("Evidence-focused articles on peptide science: mechanisms, study design and what the published literature actually shows.", "Evidence-focused articles on molecular science: analytical purity mechanisms, study design and what published chromatography actually shows."),
    @("Evidence-focused articles on peptide science", "Evidence-focused articles on molecular science"),
    @("Peptide science moves fast and claims travel faster.", "Biomolecular science moves fast and claims travel faster."),
    @("When researching peptides, analytical methods, or emerging areas", "When researching analytical compounds, reference methods, or emerging areas"),
    @("A practical framework for evaluating peptide identity, purity, peptide content, contaminants, analytical documentation, and batch-level quality", "A practical framework for evaluating sequence identity, chromatographic purity, net active content, contaminants, analytical documentation, and batch-level quality"),
    @("The Six Questions Behind Peptide Quality", "The Six Questions Behind Molecular Quality"),
    @("First Question: Do You Actually Have the Expected Peptide?", "First Question: Do You Actually Have the Expected Sequence?"),
    @("How Research Peptides Are Produced", "How Research Sequences Are Produced"),
    @("Purity and Net Peptide Content Are Different", "Purity and Net Sequence Content Are Different"),
    @("Where Do Peptide Impurities Come From?", "Where Do Sequence Impurities Come From?"),
    @("What Is a Good Peptide COA?", "What Is a Good Analytical COA?"),
    @("A Practical Peptide Quality Scorecard", "A Practical Compound Quality Scorecard"),
    @("What should a peptide COA contain?", "What should an analytical COA contain?"),
    @("Does ISO/IEC 17025 mean the peptide itself is certified?", "Does ISO/IEC 17025 mean the compound itself is certified?"),
    @("Can a peptide degrade even if the original COA showed high purity?", "Can a sequence degrade even if the original COA showed high purity?"),
    @("The Six Dimensions of Peptide Quality", "The Six Dimensions of Sequence Quality"),
    @("Purity vs. Peptide Content", "Purity vs. Active Sequence Content"),
    @("target peptide", "target sequence"),
    @("expected peptide", "expected sequence"),
    @("target peptide sequence", "target molecular sequence"),
    @("Research Peptides", "Research Sequences"),
    @("Peptide identity", "Sequence identity"),
    @("peptide identity", "sequence identity"),
    @("peptide purity", "chromatographic purity"),
    @("peptide content", "net active content"),
    @("peptide quality", "compound quality"),
    @("peptide COA", "analytical COA"),
    @("peptide synthesis", "sequence synthesis"),
    @("peptides", "synthesized sequences"),
    @("peptide", "molecular sequence"),
    @("Peptide", "Molecular Sequence")
)

$files = @(
    "index.html",
    "article-inside-the-vial.html",
    "articles.html",
    "topics.html",
    "authors.html",
    "about.html",
    "faq.html"
)

foreach ($f in $files) {
    $path = "e:\Documents\Downloads\peptide\" + $f
    if (-not (Test-Path $path)) { continue }
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    foreach ($pair in $replacements) {
        $from = $pair[0]
        $to = $pair[1]
        $content = $content.Replace($from, $to)
    }

    $outPath = $path
    if ($f -eq "article-inside-the-vial.html") {
        $outPath = "e:\Documents\Downloads\peptide\article-inside-the-synthesis.html"
        [System.IO.File]::WriteAllText($path, $content, (New-Object System.Text.UTF8Encoding($false)))
    }
    [System.IO.File]::WriteAllText($outPath, $content, (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "Processed $f -> Output: $outPath"
}